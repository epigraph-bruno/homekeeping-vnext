import { Task, Settings } from '../types';
import {
  getChicagoDate,
  getStartOfDay,
  getStartOfWeek,
  getStartOfMonth,
  isWorkday,
  isWeekend,
  getDaysUntilEndOfPeriod,
  formatPeriodKey,
} from './date';

interface AgendaItem {
  taskId: string;
  bucket: 'TODAY' | 'WEEK' | 'MONTH';
  periodDate: Date;
  dueDate: Date;
  cadenceUnit: string;
  dailyMode: string;
  assignedTo: string[];
  expectedTaps: number;
  locked: boolean;
  archived: boolean;
  archivedOn?: Date;
  isRolledIn: boolean;
  rolledFromBucket?: string;
}

export function generateAgendas(
  tasks: Task[],
  settings: Settings,
  now: Date = getChicagoDate()
): { items: AgendaItem[]; warnings: string[] } {
  const warnings: string[] = [];
  const items: AgendaItem[] = [];

  // Get period boundaries
  const today = getStartOfDay(now);
  const weekStart = getStartOfWeek(now, settings.agendaRules.weekStart as 'Monday' | 'Sunday');
  const monthStart = getStartOfMonth(now);

  // Calculate roll-in thresholds
  const daysUntilWeekEnd = getDaysUntilEndOfPeriod(now, 'week');
  const daysUntilMonthEnd = getDaysUntilEndOfPeriod(now, 'month');
  const shouldRollWeekToToday = daysUntilWeekEnd <= settings.agendaRules.rollWeekToTodayDays;
  const shouldRollMonthToWeek = daysUntilMonthEnd <= settings.agendaRules.rollMonthToWeekDays;

  for (const task of tasks) {
    if (!task.active) continue;

    try {
      switch (task.repeatUnit) {
        case 'DAY':
          // Only add to TODAY bucket
          if (isValidDailyMode(task.dailyMode, today)) {
            items.push(createAgendaItem(task, 'TODAY', today, today));
          }
          break;

        case 'WEEK':
          if (shouldRollWeekToToday) {
            // Roll into TODAY
            items.push(createAgendaItem(
              task,
              'TODAY',
              weekStart,
              today,
              true,
              'WEEK'
            ));
          } else {
            // Regular WEEK item
            items.push(createAgendaItem(task, 'WEEK', weekStart, weekStart));
          }
          break;

        case 'MONTH':
          if (shouldRollMonthToWeek) {
            // Roll into WEEK
            items.push(createAgendaItem(
              task,
              'WEEK',
              monthStart,
              weekStart,
              true,
              'MONTH'
            ));
          } else {
            // Regular MONTH item
            items.push(createAgendaItem(task, 'MONTH', monthStart, monthStart));
          }
          break;

        default:
          warnings.push(`Invalid repeat unit for task ${task.taskId}: ${task.repeatUnit}`);
      }
    } catch (error) {
      warnings.push(`Error processing task ${task.taskId}: ${error}`);
    }
  }

  return { items, warnings };
}

function isValidDailyMode(mode: string, date: Date): boolean {
  switch (mode.toUpperCase()) {
    case 'EVERYDAY':
      return true;
    case 'WORKDAYS':
      return isWorkday(date);
    case 'WEEKENDS':
      return isWeekend(date);
    default:
      return false;
  }
}

function createAgendaItem(
  task: Task,
  bucket: 'TODAY' | 'WEEK' | 'MONTH',
  periodDate: Date,
  dueDate: Date,
  isRolledIn: boolean = false,
  rolledFromBucket?: string
): AgendaItem {
  return {
    taskId: task.taskId,
    bucket,
    periodDate,
    dueDate,
    cadenceUnit: task.repeatUnit,
    dailyMode: task.dailyMode,
    assignedTo: task.assignedTo,
    expectedTaps: calculateExpectedTaps(task),
    locked: false,
    archived: false,
    isRolledIn,
    rolledFromBucket,
  };
}

function calculateExpectedTaps(task: Task): number {
  const baseCount = task.timesPerPeriod;
  const requiredPeople = task.requireBoth ? 2 : 1;
  return baseCount * requiredPeople;
}
