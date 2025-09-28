import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as XLSX from 'xlsx';
import { validateTask, validateSettings, normalizeTask, normalizeSettings } from './utils/validation';
import { ImportLog, Task, Settings, User, Group } from './types';

admin.initializeApp();

const db = admin.firestore();
const storage = admin.storage();
// const CHICAGO_TZ = 'America/Chicago';

export const onImportXlsx = functions.storage.object().onFinalize(async (object) => {
  // Only process files in the imports directory
  if (!object.name?.startsWith('imports/')) {
    return;
  }

  const bucket = storage.bucket(object.bucket);
  const tempFilePath = '/tmp/import.xlsx';
  
  try {
    // Download the file
    await bucket.file(object.name).download({
      destination: tempFilePath,
    });

    // Read the workbook
    const workbook = XLSX.readFile(tempFilePath);
    
    // Initialize import log
    const importLog: ImportLog = {
      timestamp: new Date(),
      success: false,
      counts: { users: 0, groups: 0, tasks: 0, settings: 0 },
      errors: [],
      warnings: [],
    };

    // Start a batch write
    const batch = db.batch();

    // Process Users sheet
    const usersSheet = workbook.Sheets['Users'];
    if (usersSheet) {
      const users = XLSX.utils.sheet_to_json(usersSheet);
      for (const user of users) {
        try {
          const userData: User = {
            email: (user as any)['Email'],
            displayName: (user as any)['DisplayName'],
            code: (user as any)['Code (BG/KG)'],
            isAdmin: Boolean((user as any)['IsAdmin']),
          };
          
          if (!userData.email || !userData.code) {
            importLog.errors.push({
              type: 'user',
              message: `Invalid user data: ${JSON.stringify(user)}`,
            });
            continue;
          }

          // Create user document with email as ID
          const userRef = db.collection('users').doc();
          batch.set(userRef, userData, { merge: true });
          importLog.counts.users++;
        } catch (error) {
          importLog.errors.push({
            type: 'user',
            message: `Error processing user: ${error}`,
          });
        }
      }
    }

    // Process Groups sheet
    const groupsSheet = workbook.Sheets['Groups'];
    if (groupsSheet) {
      const groups = XLSX.utils.sheet_to_json(groupsSheet);
      for (const group of groups) {
        try {
          const groupData: Group = {
            groupId: (group as any)['Group ID'],
            name: (group as any)['Group Name'],
          };

          if (!groupData.groupId || !groupData.name) {
            importLog.errors.push({
              type: 'group',
              message: `Invalid group data: ${JSON.stringify(group)}`,
            });
            continue;
          }

          const groupRef = db.collection('groups').doc(groupData.groupId);
          batch.set(groupRef, groupData, { merge: true });
          importLog.counts.groups++;
        } catch (error) {
          importLog.errors.push({
            type: 'group',
            message: `Error processing group: ${error}`,
          });
        }
      }
    }

    // Process Tasks sheet
    const tasksSheet = workbook.Sheets['Tasks'];
    if (tasksSheet) {
      const tasks = XLSX.utils.sheet_to_json(tasksSheet);
      for (const task of tasks) {
        try {
          // Map column names to property names
          const mappedTask = {
            taskId: (task as any)['Task ID'],
            name: (task as any)['Name'],
            repeatUnit: (task as any)['Repeat Unit'],
            repeatInterval: (task as any)['Repeat Interval'],
            timesPerPeriod: (task as any)['Times Per Period'],
            requireBoth: (task as any)['requireBoth'],
            assignedTo: (task as any)['AssignedTo'],
            active: (task as any)['Active'],
            notes: (task as any)['Notes / Instructions'],
            avgTaskDuration: (task as any)['Avg Task Duration (min)'],
            dailyMode: (task as any)['Daily_Mode'],
            groupId: (task as any)['Group ID'],
          };

          const { isValid, errors, warnings } = validateTask(mappedTask);
          
          if (!isValid) {
            importLog.errors.push({
              type: 'task',
              id: (task as any)['Task ID'],
              message: errors.join(', '),
            });
            continue;
          }

          warnings.forEach(warning => {
            importLog.warnings.push({
              type: 'task',
              id: (task as any)['Task ID'],
              message: warning,
            });
          });

          const taskData: Task = normalizeTask(mappedTask);
          const taskRef = db.collection('tasks').doc(taskData.taskId);
          batch.set(taskRef, taskData, { merge: true });
          importLog.counts.tasks++;
        } catch (error) {
          importLog.errors.push({
            type: 'task',
            id: (task as any)['Task ID'],
            message: `Error processing task: ${error}`,
          });
        }
      }
    }

    // Process Settings sheet
    const settingsSheet = workbook.Sheets['Settings'];
    if (settingsSheet) {
      try {
        const settingsRows = XLSX.utils.sheet_to_json(settingsSheet);
        const settingsData: any = {};
        
        // Convert rows to nested object with proper key mapping
        for (const row of settingsRows) {
          const section = (row as any)['Section'];
          const key = (row as any)['Key'];
          const value = (row as any)['Value'];
          
          if (!section || !key) continue;
          
          if (!settingsData[section]) {
            settingsData[section] = {};
          }
          
          // Map CSV keys to expected property names
          let mappedKey = key;
          if (section === 'AgendaRules') {
            if (key === 'Roll_Week_to_Today_Days') mappedKey = 'rollWeekToTodayDays';
            else if (key === 'Roll_Month_to_Week_Days') mappedKey = 'rollMonthToWeekDays';
            else if (key === 'WeekStart') mappedKey = 'weekStart';
            else if (key === 'Disallow_Cadences_Beyond_Month') mappedKey = 'disallowCadencesBeyondMonth';
            else if (key === 'Backfill_Lookback_Days') mappedKey = 'backfillLookbackDays';
          } else if (section === 'Grace') {
            if (key === 'Daily' || key === 'Daily_Grace_Days') mappedKey = 'daily';
            else if (key === 'Weekly' || key === 'Weekly_Grace_Days') mappedKey = 'weekly';
            else if (key === 'Monthly' || key === 'Monthly_Grace_Days') mappedKey = 'monthly';
          } else if (section === 'Metrics') {
            if (key === 'Enable_Simple_Weekly_Pulse') mappedKey = 'enableSimpleWeeklyPulse';
            else if (key === 'Include_Individual_In_Global') mappedKey = 'includeIndividualInGlobal';
            else if (key === 'HoursPerTap_Default') mappedKey = 'hoursPerTapDefault';
          }
          
          settingsData[section][mappedKey] = value;
        }

        const { isValid, errors, warnings } = validateSettings(settingsData);
        
        if (!isValid) {
          importLog.errors.push({
            type: 'settings',
            message: errors.join(', '),
          });
        } else {
          warnings.forEach(warning => {
            importLog.warnings.push({
              type: 'settings',
              message: warning,
            });
          });

          const normalizedSettings: Settings = normalizeSettings(settingsData);
          const settingsRef = db.collection('settings').doc('global');
          batch.set(settingsRef, normalizedSettings, { merge: true });
          importLog.counts.settings++;
        }
      } catch (error) {
        importLog.errors.push({
          type: 'settings',
          message: `Error processing settings: ${error}`,
        });
      }
    }

    // Commit the batch if there are no critical errors
    if (importLog.errors.length === 0) {
      await batch.commit();
      importLog.success = true;
    }

    // Write import log
    await db.collection('importLogs').add(importLog);

    // If import was successful, trigger agenda regeneration
    if (importLog.success) {
      // We'll implement this function next
      // await regenerateAgendas();
    }

    return importLog;
  } catch (error) {
    console.error('Import failed:', error);
    const failureLog: ImportLog = {
      timestamp: new Date(),
      success: false,
      counts: { users: 0, groups: 0, tasks: 0, settings: 0 },
      errors: [{
        type: 'settings',
        message: `Import failed: ${error}`,
      }],
      warnings: [],
    };
    await db.collection('importLogs').add(failureLog);
    throw error;
  }
});
