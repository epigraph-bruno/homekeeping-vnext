// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskEventImpl _$$TaskEventImplFromJson(Map<String, dynamic> json) =>
    _$TaskEventImpl(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      userCode: json['userCode'] as String,
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskEventImplToJson(_$TaskEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'userCode': instance.userCode,
      'date': instance.date.toIso8601String(),
      'value': instance.value,
    };
