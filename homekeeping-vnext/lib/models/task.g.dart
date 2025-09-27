// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      groupId: json['groupId'] as String,
      cadence: json['cadence'] as String,
      timesPerPeriod: (json['timesPerPeriod'] as num).toInt(),
      dailyMode: json['dailyMode'] as String,
      assignedTo: json['assignedTo'] as String,
      requireBoth: json['requireBoth'] as bool,
      avgMinutes: (json['avgMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'groupId': instance.groupId,
      'cadence': instance.cadence,
      'timesPerPeriod': instance.timesPerPeriod,
      'dailyMode': instance.dailyMode,
      'assignedTo': instance.assignedTo,
      'requireBoth': instance.requireBoth,
      'avgMinutes': instance.avgMinutes,
    };
