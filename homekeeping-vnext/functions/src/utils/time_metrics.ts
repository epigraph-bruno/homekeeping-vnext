import { Task, Settings } from '../types';

interface TimeByGroup {
  groupId: string;
  groupName: string;
  hours: number;
}

interface TimeByPerson {
  userCode: string;
  hours: number;
}

interface TimeMetrics {
  byGroup: TimeByGroup[];
  byPerson: TimeByPerson[];
  ungroupedHours: number;
  totalHours: number;
}

export function calculateTimeMetrics(
  tasks: Task[],
  events: any[],
  settings: Settings,
  groupNames: Map<string, string>
): TimeMetrics {
  // Initialize accumulators
  const groupHours = new Map<string, number>();
  const personHours = new Map<string, string>();
  let ungroupedHours = 0;
  let totalHours = 0;

  // Create task lookup map
  const taskMap = new Map(tasks.map(task => [task.taskId, task]));

  // Process each event
  for (const event of events) {
    if (event.count <= 0) continue; // Skip undo events

    const task = taskMap.get(event.taskId);
    if (!task || !task.active) continue;

    // Calculate hours for this event
    const hours = getHoursForTask(task, settings);
    totalHours += hours;

    // Add to person's total
    const personTotal = personHours.get(event.userCode) || 0;
    personHours.set(event.userCode, personTotal + hours);

    // Add to group total or ungrouped
    if (task.groupId) {
      const groupTotal = groupHours.get(task.groupId) || 0;
      groupHours.set(task.groupId, groupTotal + hours);
    } else {
      ungroupedHours += hours;
    }
  }

  // Convert to return format
  const byGroup: TimeByGroup[] = Array.from(groupHours.entries())
    .map(([groupId, hours]) => ({
      groupId,
      groupName: groupNames.get(groupId) || 'Unknown Group',
      hours,
    }))
    .sort((a, b) => b.hours - a.hours); // Sort by hours descending

  const byPerson: TimeByPerson[] = Array.from(personHours.entries())
    .map(([userCode, hours]) => ({
      userCode,
      hours,
    }))
    .sort((a, b) => b.hours - a.hours); // Sort by hours descending

  return {
    byGroup,
    byPerson,
    ungroupedHours,
    totalHours,
  };
}

function getHoursForTask(task: Task, settings: Settings): number {
  const minutes = task.avgTaskDuration || 
    (settings.metrics.hoursPerTapDefault * 60);
  return minutes / 60;
}
