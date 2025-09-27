// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgendaItemImpl _$$AgendaItemImplFromJson(Map<String, dynamic> json) =>
    _$AgendaItemImpl(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
      bucket: json['bucket'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      isRolledIn: json['isRolledIn'] as bool,
      isPastDue: json['isPastDue'] as bool,
      graceUntil: json['graceUntil'] == null
          ? null
          : DateTime.parse(json['graceUntil'] as String),
      assignedTo: json['assignedTo'] as String,
    );

Map<String, dynamic> _$$AgendaItemImplToJson(_$AgendaItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'task': instance.task,
      'bucket': instance.bucket,
      'dueDate': instance.dueDate.toIso8601String(),
      'isRolledIn': instance.isRolledIn,
      'isPastDue': instance.isPastDue,
      'graceUntil': instance.graceUntil?.toIso8601String(),
      'assignedTo': instance.assignedTo,
    };
