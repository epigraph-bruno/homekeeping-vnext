import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { getChicagoDate } from './utils/date';

interface TaskEvent {
  taskId: string;
  date: Date;
  userCode: string;
  count: number; // +1 for completion, -1 for undo
}

export const addEvents = functions.https.onCall(async (data, context) => {
  // Check authentication
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Must be authenticated to add events'
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

  // Validate input
  const events: TaskEvent[] = data.events;
  if (!Array.isArray(events) || events.length === 0) {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Events array is required'
    );
  }

  const batch = admin.firestore().batch();
  const processedKeys = new Set<string>();
  const now = getChicagoDate();

  for (const event of events) {
    // Validate event data
    if (!event.taskId || !event.date) {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Invalid event data'
      );
    }

    // Convert date string to Date
    const eventDate = new Date(event.date);
    
    // Create deduplication key
    const dedupKey = `${event.taskId}|${eventDate.toISOString()}|${userCode}`;
    
    // Skip if we've already processed this combination
    if (processedKeys.has(dedupKey)) {
      continue;
    }
    processedKeys.add(dedupKey);

    // Get the month key for the event
    const monthKey = `${eventDate.getFullYear()}-${String(eventDate.getMonth() + 1).padStart(2, '0')}`;
    
    // Create event document
    const eventRef = admin.firestore()
      .collection('events')
      .doc(monthKey)
      .collection('entries')
      .doc();

    batch.set(eventRef, {
      taskId: event.taskId,
      date: admin.firestore.Timestamp.fromDate(eventDate),
      userCode: userCode,
      count: event.count,
      createdAt: admin.firestore.Timestamp.fromDate(now),
    });
  }

  // Commit the batch
  await batch.commit();

  // Return success
  return { success: true, processedCount: processedKeys.size };
});
