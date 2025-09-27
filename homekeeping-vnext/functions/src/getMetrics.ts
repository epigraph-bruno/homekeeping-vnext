import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { getChicagoDate, getStartOfWeek } from './utils/date';
import { calculateWeekSoFar } from './utils/metrics';
import { calculateTimeMetrics } from './utils/time_metrics';
import { Task, Settings } from './types';

export const getMetrics = functions.https.onCall(async (data, context) => {
  // Check authentication
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to get metrics'
    );
  }

  // Get user from Firestore
  const userDoc = await admin.firestore()
    .collection('users')
    .doc(context.auth.uid)
    .get();

  if (!userDoc.exists) {
    throw new functions.https.HttpsError(
      'permission-denied',
      'User not found in database'
    );
  }

  const userCode = userDoc.data()?.code;
  if (!userCode) {
    throw new functions.https.HttpsError(
      'failed-precondition',
      'User code not found'
    );
  }

  try {
    const now = getChicagoDate();
    const weekStart = getStartOfWeek(now, 'Monday'); // Default to Monday for metrics

    // Get settings
    const settingsDoc = await admin.firestore()
      .collection('settings')
      .doc('global')
      .get();
    
    if (!settingsDoc.exists) {
      throw new functions.https.HttpsError(
        'failed-precondition',
        'Settings not found'
      );
    }
    const settings = settingsDoc.data() as Settings;

    // Get active tasks and groups
    const [tasksSnapshot, groupsSnapshot] = await Promise.all([
      admin.firestore()
        .collection('tasks')
        .where('active', '==', true)
        .get(),
      admin.firestore()
        .collection('groups')
        .get(),
    ]);
    
    const tasks = tasksSnapshot.docs.map(doc => ({
      taskId: doc.id,
      ...doc.data()
    })) as Task[];

    // Get this week's events
    const monthKey = `${weekStart.getFullYear()}-${String(weekStart.getMonth() + 1).padStart(2, '0')}`;
    const eventsSnapshot = await admin.firestore()
      .collection('events')
      .doc(monthKey)
      .collection('entries')
      .where('date', '>=', weekStart)
      .where('date', '<=', now)
      .get();

    const events = eventsSnapshot.docs.map(doc => ({
      eventId: doc.id,
      ...doc.data(),
      date: doc.data().date.toDate(),
    }));

    // Create group name lookup
    const groupNames = new Map(
      groupsSnapshot.docs.map(doc => [doc.id, doc.data().name as string])
    );

    // Calculate metrics
    const [weekMetrics, timeMetrics] = await Promise.all([
      calculateWeekSoFar(tasks, events, settings, userCode, now),
      calculateTimeMetrics(tasks, events, settings, groupNames),
    ]);

    return {
      weekSoFar: {
        ...weekMetrics,
        weekStart: weekStart.toISOString(),
        asOf: now.toISOString(),
      },
      time: timeMetrics,
    };
  } catch (error) {
    console.error('Error calculating metrics:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Error calculating metrics'
    );
  }
});
