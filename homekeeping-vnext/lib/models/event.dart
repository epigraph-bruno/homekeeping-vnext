import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent({
    required String id,
    required String taskId,
    required String userCode,
    required DateTime date,
    required int value,
  }) = _TaskEvent;

  factory TaskEvent.fromJson(Map<String, dynamic> json) =>
      _$TaskEventFromJson(json);
}