import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_metrics.freezed.dart';
part 'time_metrics.g.dart';

@freezed
class TimeByGroup with _$TimeByGroup {
  const factory TimeByGroup({
    required String groupId,
    required String groupName,
    required double hours,
  }) = _TimeByGroup;

  factory TimeByGroup.fromJson(Map<String, dynamic> json) =>
      _$TimeByGroupFromJson(json);
}

@freezed
class TimeByPerson with _$TimeByPerson {
  const factory TimeByPerson({
    required String userCode,
    required double hours,
  }) = _TimeByPerson;

  factory TimeByPerson.fromJson(Map<String, dynamic> json) =>
      _$TimeByPersonFromJson(json);
}

@freezed
class TimeMetrics with _$TimeMetrics {
  const factory TimeMetrics({
    required List<TimeByGroup> byGroup,
    required List<TimeByPerson> byPerson,
    required double ungroupedHours,
    required double totalHours,
  }) = _TimeMetrics;

  factory TimeMetrics.fromJson(Map<String, dynamic> json) =>
      _$TimeMetricsFromJson(json);
}
