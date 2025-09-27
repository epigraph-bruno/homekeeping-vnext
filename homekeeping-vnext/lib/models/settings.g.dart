// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      agendaRules:
          AgendaRules.fromJson(json['agendaRules'] as Map<String, dynamic>),
      grace: GraceSettings.fromJson(json['grace'] as Map<String, dynamic>),
      metrics:
          MetricsSettings.fromJson(json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'agendaRules': instance.agendaRules,
      'grace': instance.grace,
      'metrics': instance.metrics,
    };

_$AgendaRulesImpl _$$AgendaRulesImplFromJson(Map<String, dynamic> json) =>
    _$AgendaRulesImpl(
      weekStart: json['weekStart'] as String,
      rollWeekToTodayDays: (json['rollWeekToTodayDays'] as num).toInt(),
      rollMonthToWeekDays: (json['rollMonthToWeekDays'] as num).toInt(),
      disallowCadencesBeyondMonth: json['disallowCadencesBeyondMonth'] as bool,
      backfillLookbackDays:
          (json['backfillLookbackDays'] as num?)?.toInt() ?? 90,
    );

Map<String, dynamic> _$$AgendaRulesImplToJson(_$AgendaRulesImpl instance) =>
    <String, dynamic>{
      'weekStart': instance.weekStart,
      'rollWeekToTodayDays': instance.rollWeekToTodayDays,
      'rollMonthToWeekDays': instance.rollMonthToWeekDays,
      'disallowCadencesBeyondMonth': instance.disallowCadencesBeyondMonth,
      'backfillLookbackDays': instance.backfillLookbackDays,
    };

_$GraceSettingsImpl _$$GraceSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GraceSettingsImpl(
      daily: (json['daily'] as num).toInt(),
      weekly: (json['weekly'] as num).toInt(),
      monthly: (json['monthly'] as num).toInt(),
    );

Map<String, dynamic> _$$GraceSettingsImplToJson(_$GraceSettingsImpl instance) =>
    <String, dynamic>{
      'daily': instance.daily,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
    };

_$MetricsSettingsImpl _$$MetricsSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$MetricsSettingsImpl(
      enableSimpleWeeklyPulse: json['enableSimpleWeeklyPulse'] as bool,
      includeIndividualInGlobal: json['includeIndividualInGlobal'] as bool,
      hoursPerTapDefault: (json['hoursPerTapDefault'] as num).toDouble(),
    );

Map<String, dynamic> _$$MetricsSettingsImplToJson(
        _$MetricsSettingsImpl instance) =>
    <String, dynamic>{
      'enableSimpleWeeklyPulse': instance.enableSimpleWeeklyPulse,
      'includeIndividualInGlobal': instance.includeIndividualInGlobal,
      'hoursPerTapDefault': instance.hoursPerTapDefault,
    };
