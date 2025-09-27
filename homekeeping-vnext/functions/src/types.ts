export interface User {
  email: string;
  displayName: string;
  code: string; // BG or KG
  isAdmin: boolean;
}

export interface Group {
  groupId: string;
  name: string;
}

export interface Task {
  taskId: string;
  name: string;
  repeatUnit: 'DAY' | 'WEEK' | 'MONTH';
  repeatInterval: number;
  timesPerPeriod: number;
  requireBoth: boolean;
  assignedTo: string[]; // Array of user codes (BG, KG) or empty for shared
  active: boolean;
  notes?: string;
  avgTaskDuration?: number; // in minutes
  dailyMode: 'EVERYDAY' | 'WORKDAYS' | 'WEEKENDS';
  groupId?: string;
}

export interface Settings {
  agendaRules: {
    weekStart: string; // e.g., "Monday"
    rollWeekToTodayDays: number;
    rollMonthToWeekDays: number;
    disallowCadencesBeyondMonth: boolean;
    backfillLookbackDays: number;
  };
  grace: {
    daily: number; // days
    weekly: number;
    monthly: number;
  };
  metrics: {
    enableSimpleWeeklyPulse: boolean;
    includeIndividualInGlobal: boolean;
    hoursPerTapDefault: number;
  };
}

export interface ImportLog {
  timestamp: Date;
  success: boolean;
  counts: {
    users: number;
    groups: number;
    tasks: number;
    settings: number;
  };
  errors: Array<{
    type: 'user' | 'group' | 'task' | 'settings';
    id?: string;
    message: string;
  }>;
  warnings: Array<{
    type: 'user' | 'group' | 'task' | 'settings';
    id?: string;
    message: string;
  }>;
}
