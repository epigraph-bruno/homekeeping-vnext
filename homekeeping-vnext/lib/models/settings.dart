import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required AgendaRules agendaRules,
    required GraceSettings grace,
    required MetricsSettings metrics,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}

@freezed
class AgendaRules with _$AgendaRules {
  const factory AgendaRules({
    required String weekStart,
    required int rollWeekToTodayDays,
    required int rollMonthToWeekDays,
    required bool disallowCadencesBeyondMonth,
    @Default(90) int backfillLookbackDays,
  }) = _AgendaRules;

  factory AgendaRules.fromJson(Map<String, dynamic> json) =>
      _$AgendaRulesFromJson(json);
}

@freezed
class GraceSettings with _$GraceSettings {
  const factory GraceSettings({
    required int daily,
    required int weekly,
    required int monthly,
  }) = _GraceSettings;

  factory GraceSettings.fromJson(Map<String, dynamic> json) =>
      _$GraceSettingsFromJson(json);
}

@freezed
class MetricsSettings with _$MetricsSettings {
  const factory MetricsSettings({
    required bool enableSimpleWeeklyPulse,
    required bool includeIndividualInGlobal,
    required double hoursPerTapDefault,
  }) = _MetricsSettings;

  factory MetricsSettings.fromJson(Map<String, dynamic> json) =>
      _$MetricsSettingsFromJson(json);
}