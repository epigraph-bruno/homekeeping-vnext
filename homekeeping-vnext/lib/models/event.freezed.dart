// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskEvent _$TaskEventFromJson(Map<String, dynamic> json) {
  return _TaskEvent.fromJson(json);
}

/// @nodoc
mixin _$TaskEvent {
  String get id => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;
  String get userCode => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskEventCopyWith<TaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res, TaskEvent>;
  @useResult
  $Res call(
      {String id, String taskId, String userCode, DateTime date, int value});
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res, $Val extends TaskEvent>
    implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? userCode = null,
    Object? date = null,
    Object? value = null,
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
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskEventImplCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory _$$TaskEventImplCopyWith(
          _$TaskEventImpl value, $Res Function(_$TaskEventImpl) then) =
      __$$TaskEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String taskId, String userCode, DateTime date, int value});
}

/// @nodoc
class __$$TaskEventImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$TaskEventImpl>
    implements _$$TaskEventImplCopyWith<$Res> {
  __$$TaskEventImplCopyWithImpl(
      _$TaskEventImpl _value, $Res Function(_$TaskEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? userCode = null,
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_$TaskEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskEventImpl implements _TaskEvent {
  const _$TaskEventImpl(
      {required this.id,
      required this.taskId,
      required this.userCode,
      required this.date,
      required this.value});

  factory _$TaskEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskEventImplFromJson(json);

  @override
  final String id;
  @override
  final String taskId;
  @override
  final String userCode;
  @override
  final DateTime date;
  @override
  final int value;

  @override
  String toString() {
    return 'TaskEvent(id: $id, taskId: $taskId, userCode: $userCode, date: $date, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, taskId, userCode, date, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEventImplCopyWith<_$TaskEventImpl> get copyWith =>
      __$$TaskEventImplCopyWithImpl<_$TaskEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskEventImplToJson(
      this,
    );
  }
}

abstract class _TaskEvent implements TaskEvent {
  const factory _TaskEvent(
      {required final String id,
      required final String taskId,
      required final String userCode,
      required final DateTime date,
      required final int value}) = _$TaskEventImpl;

  factory _TaskEvent.fromJson(Map<String, dynamic> json) =
      _$TaskEventImpl.fromJson;

  @override
  String get id;
  @override
  String get taskId;
  @override
  String get userCode;
  @override
  DateTime get date;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$TaskEventImplCopyWith<_$TaskEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
