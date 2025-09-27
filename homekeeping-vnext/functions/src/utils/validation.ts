import { Task, Settings } from '../types';

export function validateTask(task: any): { isValid: boolean; errors: string[]; warnings: string[] } {
  const errors: string[] = [];
  const warnings: string[] = [];

  // Required fields
  if (!task.taskId) errors.push('Task ID is required');
  if (!task.name) errors.push('Task name is required');
  if (!task.repeatUnit) errors.push('Repeat unit is required');
  if (task.repeatInterval === undefined) errors.push('Repeat interval is required');
  if (task.timesPerPeriod === undefined) errors.push('Times per period is required');
  if (task.requireBoth === undefined) errors.push('requireBoth is required');
  if (task.active === undefined) errors.push('Active status is required');

  // Field validations
  if (task.repeatUnit && !['DAY', 'WEEK', 'MONTH'].includes(task.repeatUnit.toUpperCase())) {
    errors.push('Invalid repeat unit. Must be DAY, WEEK, or MONTH');
  }

  if (task.repeatInterval && task.repeatInterval < 1) {
    errors.push('Repeat interval must be >= 1');
  }

  if (task.timesPerPeriod && task.timesPerPeriod < 1) {
    errors.push('Times per period must be >= 1');
  }

  // Daily mode validation
  if (task.dailyMode) {
    const mode = task.dailyMode.toUpperCase();
    if (!['EVERYDAY', 'WORKDAYS', 'WEEKENDS'].includes(mode)) {
      errors.push('Invalid daily mode. Must be EVERYDAY, WORKDAYS, or WEEKENDS');
    }
  } else {
    warnings.push('Daily mode not specified, defaulting to EVERYDAY');
  }

  // requireBoth constraints
  if (task.requireBoth === true) {
    if (task.assignedTo && task.assignedTo.length === 1) {
      errors.push('Tasks with requireBoth=true cannot be assigned to a single user');
    }
  }

  // Duration warning
  if (task.avgTaskDuration === undefined) {
    warnings.push('Average task duration not specified, will use default');
  }

  // Group ID warning
  if (!task.groupId) {
    warnings.push('No group ID specified, task will be ungrouped');
  }

  return {
    isValid: errors.length === 0,
    errors,
    warnings,
  };
}

export function validateSettings(settings: any): { isValid: boolean; errors: string[]; warnings: string[] } {
  const errors: string[] = [];
  const warnings: string[] = [];

  // Required fields
  if (!settings.agendaRules) errors.push('Agenda rules are required');
  if (!settings.grace) errors.push('Grace settings are required');
  if (!settings.metrics) errors.push('Metrics settings are required');

  if (settings.agendaRules) {
    if (!settings.agendaRules.weekStart) {
      errors.push('Week start day is required');
    } else if (!['Monday', 'Sunday'].includes(settings.agendaRules.weekStart)) {
      errors.push('Week start must be Monday or Sunday');
    }

    if (settings.agendaRules.rollWeekToTodayDays === undefined) {
      errors.push('Roll week to today days is required');
    }
    if (settings.agendaRules.rollMonthToWeekDays === undefined) {
      errors.push('Roll month to week days is required');
    }
  }

  if (settings.grace) {
    if (settings.grace.daily === undefined) errors.push('Daily grace period is required');
    if (settings.grace.weekly === undefined) errors.push('Weekly grace period is required');
    if (settings.grace.monthly === undefined) errors.push('Monthly grace period is required');

    // Validate grace periods are positive
    if (settings.grace.daily < 0) errors.push('Daily grace period must be >= 0');
    if (settings.grace.weekly < 0) errors.push('Weekly grace period must be >= 0');
    if (settings.grace.monthly < 0) errors.push('Monthly grace period must be >= 0');
  }

  if (settings.metrics) {
    if (settings.metrics.hoursPerTapDefault === undefined) {
      errors.push('Default hours per tap is required');
    } else if (settings.metrics.hoursPerTapDefault <= 0) {
      errors.push('Default hours per tap must be > 0');
    }
  }

  return {
    isValid: errors.length === 0,
    errors,
    warnings,
  };
}

export function normalizeTask(task: any): Task {
  return {
    taskId: task.taskId,
    name: task.name,
    repeatUnit: task.repeatUnit.toUpperCase(),
    repeatInterval: Number(task.repeatInterval),
    timesPerPeriod: Number(task.timesPerPeriod),
    requireBoth: Boolean(task.requireBoth),
    assignedTo: task.assignedTo ? 
      (typeof task.assignedTo === 'string' ? task.assignedTo.split(',').map((s: string) => s.trim()) : task.assignedTo) : 
      [],
    active: Boolean(task.active),
    notes: task.notes || undefined,
    avgTaskDuration: task.avgTaskDuration ? Number(task.avgTaskDuration) : undefined,
    dailyMode: (task.dailyMode || 'EVERYDAY').toUpperCase(),
    groupId: task.groupId || undefined,
  };
}

export function normalizeSettings(settings: any): Settings {
  return {
    agendaRules: {
      weekStart: settings.agendaRules.weekStart || 'Monday',
      rollWeekToTodayDays: Number(settings.agendaRules.rollWeekToTodayDays),
      rollMonthToWeekDays: Number(settings.agendaRules.rollMonthToWeekDays),
      disallowCadencesBeyondMonth: Boolean(settings.agendaRules.disallowCadencesBeyondMonth),
      backfillLookbackDays: Number(settings.agendaRules.backfillLookbackDays || 90),
    },
    grace: {
      daily: Number(settings.grace.daily),
      weekly: Number(settings.grace.weekly),
      monthly: Number(settings.grace.monthly),
    },
    metrics: {
      enableSimpleWeeklyPulse: Boolean(settings.metrics.enableSimpleWeeklyPulse),
      includeIndividualInGlobal: Boolean(settings.metrics.includeIndividualInGlobal),
      hoursPerTapDefault: Number(settings.metrics.hoursPerTapDefault),
    },
  };
}
