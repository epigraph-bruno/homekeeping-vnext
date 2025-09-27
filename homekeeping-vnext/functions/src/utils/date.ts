import * as momentTz from 'moment-timezone';

const CHICAGO_TZ = 'America/Chicago';

export function getChicagoDate(date: Date = new Date()): Date {
  return new Date(momentTz.tz(date, CHICAGO_TZ).format());
}

export function getStartOfDay(date: Date): Date {
  return new Date(
    momentTz.tz(date, CHICAGO_TZ).startOf('day').format()
  );
}

export function getStartOfWeek(date: Date, weekStart: 'Monday' | 'Sunday'): Date {
  const startDay = weekStart === 'Monday' ? 1 : 0;
  return new Date(
    momentTz.tz(date, CHICAGO_TZ).startOf('week').day(startDay).format()
  );
}

export function getStartOfMonth(date: Date): Date {
  return new Date(
    momentTz.tz(date, CHICAGO_TZ).startOf('month').format()
  );
}

export function addDays(date: Date, days: number): Date {
  return new Date(
    momentTz.tz(date, CHICAGO_TZ).add(days, 'days').format()
  );
}

export function isWorkday(date: Date): boolean {
  const day = momentTz.tz(date, CHICAGO_TZ).day();
  return day >= 1 && day <= 5; // Monday = 1, Friday = 5
}

export function isWeekend(date: Date): boolean {
  const day = momentTz.tz(date, CHICAGO_TZ).day();
  return day === 0 || day === 6; // Sunday = 0, Saturday = 6
}

export function getDaysUntilEndOfPeriod(date: Date, period: 'week' | 'month'): number {
  const momentDate = momentTz.tz(date, CHICAGO_TZ);
  const endOfPeriod = period === 'week' ? 
    momentDate.clone().endOf('week') :
    momentDate.clone().endOf('month');
  
  return endOfPeriod.diff(momentDate, 'days');
}

export function formatPeriodKey(date: Date, period: 'day' | 'week' | 'month'): string {
  const momentDate = momentTz.tz(date, CHICAGO_TZ);
  
  switch (period) {
    case 'day':
      return momentDate.format('YYYY-MM-DD');
    case 'week':
      return momentDate.startOf('week').format('YYYY-MM-DD');
    case 'month':
      return momentDate.format('YYYY-MM');
    default:
      throw new Error(`Invalid period: ${period}`);
  }
}
