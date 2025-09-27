// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeByGroupImpl _$$TimeByGroupImplFromJson(Map<String, dynamic> json) =>
    _$TimeByGroupImpl(
      groupId: json['groupId'] as String,
      groupName: json['groupName'] as String,
      hours: (json['hours'] as num).toDouble(),
    );

Map<String, dynamic> _$$TimeByGroupImplToJson(_$TimeByGroupImpl instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'hours': instance.hours,
    };

_$TimeByPersonImpl _$$TimeByPersonImplFromJson(Map<String, dynamic> json) =>
    _$TimeByPersonImpl(
      userCode: json['userCode'] as String,
      hours: (json['hours'] as num).toDouble(),
    );

Map<String, dynamic> _$$TimeByPersonImplToJson(_$TimeByPersonImpl instance) =>
    <String, dynamic>{
      'userCode': instance.userCode,
      'hours': instance.hours,
    };

_$TimeMetricsImpl _$$TimeMetricsImplFromJson(Map<String, dynamic> json) =>
    _$TimeMetricsImpl(
      byGroup: (json['byGroup'] as List<dynamic>)
          .map((e) => TimeByGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      byPerson: (json['byPerson'] as List<dynamic>)
          .map((e) => TimeByPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      ungroupedHours: (json['ungroupedHours'] as num).toDouble(),
      totalHours: (json['totalHours'] as num).toDouble(),
    );

Map<String, dynamic> _$$TimeMetricsImplToJson(_$TimeMetricsImpl instance) =>
    <String, dynamic>{
      'byGroup': instance.byGroup,
      'byPerson': instance.byPerson,
      'ungroupedHours': instance.ungroupedHours,
      'totalHours': instance.totalHours,
    };
