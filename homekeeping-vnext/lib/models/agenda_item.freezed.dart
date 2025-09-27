// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agenda_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgendaItem _$AgendaItemFromJson(Map<String, dynamic> json) {
  return _AgendaItem.fromJson(json);
}

/// @nodoc
mixin _$AgendaItem {
  String get id => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;
  Task get task => throw _privateConstructorUsedError;
  String get bucket => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  bool get isRolledIn => throw _privateConstructorUsedError;
  bool get isPastDue => throw _privateConstructorUsedError;
  DateTime? get graceUntil => throw _privateConstructorUsedError;
  String get assignedTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgendaItemCopyWith<AgendaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaItemCopyWith<$Res> {
  factory $AgendaItemCopyWith(
          AgendaItem value, $Res Function(AgendaItem) then) =
      _$AgendaItemCopyWithImpl<$Res, AgendaItem>;
  @useResult
  $Res call(
      {String id,
      String taskId,
      Task task,
      String bucket,
      DateTime dueDate,
      bool isRolledIn,
      bool isPastDue,
      DateTime? graceUntil,
      String assignedTo});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$AgendaItemCopyWithImpl<$Res, $Val extends AgendaItem>
    implements $AgendaItemCopyWith<$Res> {
  _$AgendaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? task = null,
    Object? bucket = null,
    Object? dueDate = null,
    Object? isRolledIn = null,
    Object? isPastDue = null,
    Object? graceUntil = freezed,
    Object? assignedTo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      bucket: null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRolledIn: null == isRolledIn
          ? _value.isRolledIn
          : isRolledIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isPastDue: null == isPastDue
          ? _value.isPastDue
          : isPastDue // ignore: cast_nullable_to_non_nullable
              as bool,
      graceUntil: freezed == graceUntil
          ? _value.graceUntil
          : graceUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgendaItemImplCopyWith<$Res>
    implements $AgendaItemCopyWith<$Res> {
  factory _$$AgendaItemImplCopyWith(
          _$AgendaItemImpl value, $Res Function(_$AgendaItemImpl) then) =
      __$$AgendaItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String taskId,
      Task task,
      String bucket,
      DateTime dueDate,
      bool isRolledIn,
      bool isPastDue,
      DateTime? graceUntil,
      String assignedTo});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$AgendaItemImplCopyWithImpl<$Res>
    extends _$AgendaItemCopyWithImpl<$Res, _$AgendaItemImpl>
    implements _$$AgendaItemImplCopyWith<$Res> {
  __$$AgendaItemImplCopyWithImpl(
      _$AgendaItemImpl _value, $Res Function(_$AgendaItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? task = null,
    Object? bucket = null,
    Object? dueDate = null,
    Object? isRolledIn = null,
    Object? isPastDue = null,
    Object? graceUntil = freezed,
    Object? assignedTo = null,
  }) {
    return _then(_$AgendaItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      bucket: null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRolledIn: null == isRolledIn
          ? _value.isRolledIn
          : isRolledIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isPastDue: null == isPastDue
          ? _value.isPastDue
          : isPastDue // ignore: cast_nullable_to_non_nullable
              as bool,
      graceUntil: freezed == graceUntil
          ? _value.graceUntil
          : graceUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgendaItemImpl implements _AgendaItem {
  const _$AgendaItemImpl(
      {required this.id,
      required this.taskId,
      required this.task,
      required this.bucket,
      required this.dueDate,
      required this.isRolledIn,
      required this.isPastDue,
      required this.graceUntil,
      required this.assignedTo});

  factory _$AgendaItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgendaItemImplFromJson(json);

  @override
  final String id;
  @override
  final String taskId;
  @override
  final Task task;
  @override
  final String bucket;
  @override
  final DateTime dueDate;
  @override
  final bool isRolledIn;
  @override
  final bool isPastDue;
  @override
  final DateTime? graceUntil;
  @override
  final String assignedTo;

  @override
  String toString() {
    return 'AgendaItem(id: $id, taskId: $taskId, task: $task, bucket: $bucket, dueDate: $dueDate, isRolledIn: $isRolledIn, isPastDue: $isPastDue, graceUntil: $graceUntil, assignedTo: $assignedTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgendaItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.isRolledIn, isRolledIn) ||
                other.isRolledIn == isRolledIn) &&
            (identical(other.isPastDue, isPastDue) ||
                other.isPastDue == isPastDue) &&
            (identical(other.graceUntil, graceUntil) ||
                other.graceUntil == graceUntil) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, taskId, task, bucket,
      dueDate, isRolledIn, isPastDue, graceUntil, assignedTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgendaItemImplCopyWith<_$AgendaItemImpl> get copyWith =>
      __$$AgendaItemImplCopyWithImpl<_$AgendaItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgendaItemImplToJson(
      this,
    );
  }
}

abstract class _AgendaItem implements AgendaItem {
  const factory _AgendaItem(
      {required final String id,
      required final String taskId,
      required final Task task,
      required final String bucket,
      required final DateTime dueDate,
      required final bool isRolledIn,
      required final bool isPastDue,
      required final DateTime? graceUntil,
      required final String assignedTo}) = _$AgendaItemImpl;

  factory _AgendaItem.fromJson(Map<String, dynamic> json) =
      _$AgendaItemImpl.fromJson;

  @override
  String get id;
  @override
  String get taskId;
  @override
  Task get task;
  @override
  String get bucket;
  @override
  DateTime get dueDate;
  @override
  bool get isRolledIn;
  @override
  bool get isPastDue;
  @override
  DateTime? get graceUntil;
  @override
  String get assignedTo;
  @override
  @JsonKey(ignore: true)
  _$$AgendaItemImplCopyWith<_$AgendaItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
