import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { Task, Settings } from './types';
import { generateAgendas } from './utils/agenda';
import { getChicagoDate, formatPeriodKey } from './utils/date';

// Initialize if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();

export const regenerateAgendas = functions.pubsub
  .schedule('0 1 * * *') // 1:00 AM every day (Chicago time)
  .timeZone('America/Chicago')
  .onRun(async () => {
    const now = getChicagoDate();
    
    try {
      // Get all active tasks
      const tasksSnapshot = await db
        .collection('tasks')
        .where('active', '==', true)
        .get();
      
      const tasks = tasksSnapshot.docs.map(doc => ({
        taskId: doc.id,
        ...doc.data(),
      })) as Task[];

      // Get settings
      const settingsDoc = await db.collection('settings').doc('global').get();
      const settings = settingsDoc.data() as Settings;

      // Generate new agendas
      const { items, warnings } = generateAgendas(tasks, settings, now);

      // Batch write new agenda items
      const batch = db.batch();

      // Create period documents and items
      const periodGroups = items.reduce((acc, item) => {
        const key = formatPeriodKey(item.periodDate, 
          item.bucket === 'TODAY' ? 'day' : 
          item.bucket === 'WEEK' ? 'week' : 'month'
        );
        if (!acc[key]) acc[key] = [];
        acc[key].push(item);
        return acc;
      }, {} as { [key: string]: typeof items });

      // Write items by period
      for (const [periodKey, periodItems] of Object.entries(periodGroups)) {
        const periodRef = db.collection('agendas').doc(periodKey);
        
        // Create items subcollection
        for (const item of periodItems) {
          const itemRef = periodRef.collection('items').doc();
          batch.set(itemRef, {
            ...item,
            periodDate: admin.firestore.Timestamp.fromDate(item.periodDate),
            dueDate: admin.firestore.Timestamp.fromDate(item.dueDate),
            archivedOn: item.archivedOn ? 
              admin.firestore.Timestamp.fromDate(item.archivedOn) : 
              null,
          });
        }
      }

      // Handle grace periods
      await handleGracePeriods(batch, settings, now);

      // Commit all changes
      await batch.commit();

      // Log regeneration result
      await db.collection('agendaLogs').add({
        timestamp: admin.firestore.Timestamp.fromDate(now),
        itemCount: items.length,
        warnings,
      });

      return { success: true, itemCount: items.length, warnings };
    } catch (error) {
      console.error('Agenda regeneration failed:', error);
      throw error;
    }
  });

async function handleGracePeriods(
  batch: admin.firestore.WriteBatch,
  settings: Settings,
  now: Date
) {
  // Get all non-archived items from previous periods
  const previousPeriods = await db
    .collectionGroup('items')
    .where('archived', '==', false)
    .where('dueDate', '<', now)
    .get();

  for (const doc of previousPeriods.docs) {
    const item = doc.data();
    const dueDate = item.dueDate.toDate();
    const graceDays = getGraceDays(item.bucket, settings);
    const graceEnd = new Date(dueDate);
    graceEnd.setDate(graceEnd.getDate() + graceDays);

    if (now > graceEnd) {
      // Past grace period - archive the item
      batch.update(doc.ref, {
        archived: true,
        locked: true,
        archivedOn: admin.firestore.Timestamp.fromDate(now),
      });
    } else {
      // Still in grace - mark as locked but not archived
      batch.update(doc.ref, {
        locked: true,
      });
    }
  }
}

function getGraceDays(bucket: string, settings: Settings): number {
  switch (bucket) {
    case 'TODAY':
      return settings.grace.daily;
    case 'WEEK':
      return settings.grace.weekly;
    case 'MONTH':
      return settings.grace.monthly;
    default:
      return 0;
  }
}
