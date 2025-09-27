import { Task, Settings } from '../types';
import { getStartOfWeek, isWorkday, isWeekend } from './date';

interface WeekMetrics {
  expected: number;
  done: number;
  rateSoFar: number;
  personalExpected: number;
  personalDone: number;
  personalRateSoFar: number;
}

export function calculateWeekSoFar(
  tasks: Task[],
  events: any[],
  settings: Settings,
  userCode: string,
  now: Date
): WeekMetrics {
  const weekStart = getStartOfWeek(now, settings.agendaRules.weekStart as 'Monday' | 'Sunday');
  const daysInWeek = getDaysInWeek(weekStart, now);

  // Calculate expected tasks
  const { expected, personalExpected } = calculateExpectedTasks(
    tasks,
    daysInWeek,
    userCode,
    settings
  );

  // Calculate done tasks
  const { done, personalDone } = calculateDoneTasks(
    events,
    tasks,
    userCode,
    settings
  );

  return {
    expected,
    done,
    rateSoFar: expected > 0 ? done / expected : 0,
    personalExpected,
    personalDone,
    personalRateSoFar: personalExpected > 0 ? personalDone / personalExpected : 0,
  };
}

function getDaysInWeek(weekStart: Date, now: Date): Date[] {
  const days: Date[] = [];
  let current = new Date(weekStart);

  while (current <= now) {
    days.push(new Date(current));
    current.setDate(current.getDate() + 1);
  }

  return days;
}

function calculateExpectedTasks(
  tasks: Task[],
  days: Date[],
  userCode: string,
  settings: Settings
): { expected: number; personalExpected: number } {
  let expected = 0;
  let personalExpected = 0;

  for (const task of tasks) {
    if (!task.active) continue;

    const isPersonal = task.assignedTo.length === 1 && 
                      task.assignedTo[0] === userCode;

    // Calculate expected taps based on cadence
    let taskExpected = 0;

    switch (task.repeatUnit) {
      case 'DAY':
        // Count applicable days based on daily mode
        const applicableDays = days.filter(day => {
          switch (task.dailyMode) {
            case 'EVERYDAY':
              return true;
            case 'WORKDAYS':
              return isWorkday(day);
            case 'WEEKENDS':
              return isWeekend(day);
            default:
              return false;
          }
        }).length;
        taskExpected = applicableDays * task.timesPerPeriod;
        break;

      case 'WEEK':
        // Full week's worth if we're past the expected taps per week
        taskExpected = task.timesPerPeriod;
        break;

      case 'MONTH':
        // Only count if rolled into week
        const daysUntilMonthEnd = new Date(
          days[0].getFullYear(),
          days[0].getMonth() + 1,
          0
        ).getDate() - days[0].getDate() + 1;

        if (daysUntilMonthEnd <= settings.agendaRules.rollMonthToWeekDays) {
          taskExpected = task.timesPerPeriod;
        }
        break;
    }

    // Multiply by required people
    taskExpected *= task.requireBoth ? 2 : 1;

    // Add to appropriate counter
    if (isPersonal) {
      personalExpected += taskExpected;
    } else if (!settings.metrics.includeIndividualInGlobal) {
      expected += taskExpected;
    }
  }

  return { expected, personalExpected };
}

function calculateDoneTasks(
  events: any[],
  tasks: Task[],
  userCode: string,
  settings: Settings
): { done: number; personalDone: number } {
  let done = 0;
  let personalDone = 0;

  // Create a map of taskId to Task for quick lookup
  const taskMap = new Map(tasks.map(task => [task.taskId, task]));

  // Group events by taskId and date to count distinct completions
  const completions = new Map<string, Set<string>>();

  for (const event of events) {
    if (event.count <= 0) continue; // Skip undo events

    const task = taskMap.get(event.taskId);
    if (!task || !task.active) continue;

    const isPersonal = task.assignedTo.length === 1 && 
                      task.assignedTo[0] === userCode;

    // Create unique key for task+date
    const key = `${event.taskId}|${event.date.toISOString().split('T')[0]}`;
    
    if (!completions.has(key)) {
      completions.set(key, new Set());
    }
    completions.get(key)!.add(event.userCode);

    // Count if this is a new completion for this task+date
    if (isPersonal) {
      personalDone = completions.get(key)!.size;
    } else if (!settings.metrics.includeIndividualInGlobal) {
      done = completions.get(key)!.size;
    }
  }

  return { done, personalDone };
}
