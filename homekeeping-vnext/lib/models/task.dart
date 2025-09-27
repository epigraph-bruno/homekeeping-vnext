import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    required String description,
    required String groupId,
    required String cadence,
    required int timesPerPeriod,
    required String dailyMode,
    required String assignedTo,
    required bool requireBoth,
    required int avgMinutes,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}