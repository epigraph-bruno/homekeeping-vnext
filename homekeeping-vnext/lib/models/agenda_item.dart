import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homekeeping/models/task.dart';

part 'agenda_item.freezed.dart';
part 'agenda_item.g.dart';

@freezed
class AgendaItem with _$AgendaItem {
  const factory AgendaItem({
    required String id,
    required String taskId,
    required Task task,
    required String bucket,
    required DateTime dueDate,
    required bool isRolledIn,
    required bool isPastDue,
    required DateTime? graceUntil,
    required String assignedTo,
  }) = _AgendaItem;

  factory AgendaItem.fromJson(Map<String, dynamic> json) =>
      _$AgendaItemFromJson(json);
}