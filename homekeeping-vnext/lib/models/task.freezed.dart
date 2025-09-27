// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get cadence => throw _privateConstructorUsedError;
  int get timesPerPeriod => throw _privateConstructorUsedError;
  String get dailyMode => throw _privateConstructorUsedError;
  String get assignedTo => throw _privateConstructorUsedError;
  bool get requireBoth => throw _privateConstructorUsedError;
  int get avgMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String groupId,
      String cadence,
      int timesPerPeriod,
      String dailyMode,
      String assignedTo,
      bool requireBoth,
      int avgMinutes});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? groupId = null,
    Object? cadence = null,
    Object? timesPerPeriod = null,
    Object? dailyMode = null,
    Object? assignedTo = null,
    Object? requireBoth = null,
    Object? avgMinutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      cadence: null == cadence
          ? _value.cadence
          : cadence // ignore: cast_nullable_to_non_nullable
              as String,
      timesPerPeriod: null == timesPerPeriod
          ? _value.timesPerPeriod
          : timesPerPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      dailyMode: null == dailyMode
          ? _value.dailyMode
          : dailyMode // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
      requireBoth: null == requireBoth
          ? _value.requireBoth
          : requireBoth // ignore: cast_nullable_to_non_nullable
              as bool,
      avgMinutes: null == avgMinutes
          ? _value.avgMinutes
          : avgMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String groupId,
      String cadence,
      int timesPerPeriod,
      String dailyMode,
      String assignedTo,
      bool requireBoth,
      int avgMinutes});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? groupId = null,
    Object? cadence = null,
    Object? timesPerPeriod = null,
    Object? dailyMode = null,
    Object? assignedTo = null,
    Object? requireBoth = null,
    Object? avgMinutes = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      cadence: null == cadence
          ? _value.cadence
          : cadence // ignore: cast_nullable_to_non_nullable
              as String,
      timesPerPeriod: null == timesPerPeriod
          ? _value.timesPerPeriod
          : timesPerPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      dailyMode: null == dailyMode
          ? _value.dailyMode
          : dailyMode // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
      requireBoth: null == requireBoth
          ? _value.requireBoth
          : requireBoth // ignore: cast_nullable_to_non_nullable
              as bool,
      avgMinutes: null == avgMinutes
          ? _value.avgMinutes
          : avgMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.groupId,
      required this.cadence,
      required this.timesPerPeriod,
      required this.dailyMode,
      required this.assignedTo,
      required this.requireBoth,
      required this.avgMinutes});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String groupId;
  @override
  final String cadence;
  @override
  final int timesPerPeriod;
  @override
  final String dailyMode;
  @override
  final String assignedTo;
  @override
  final bool requireBoth;
  @override
  final int avgMinutes;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, groupId: $groupId, cadence: $cadence, timesPerPeriod: $timesPerPeriod, dailyMode: $dailyMode, assignedTo: $assignedTo, requireBoth: $requireBoth, avgMinutes: $avgMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.cadence, cadence) || other.cadence == cadence) &&
            (identical(other.timesPerPeriod, timesPerPeriod) ||
                other.timesPerPeriod == timesPerPeriod) &&
            (identical(other.dailyMode, dailyMode) ||
                other.dailyMode == dailyMode) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.requireBoth, requireBoth) ||
                other.requireBoth == requireBoth) &&
            (identical(other.avgMinutes, avgMinutes) ||
                other.avgMinutes == avgMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, groupId,
      cadence, timesPerPeriod, dailyMode, assignedTo, requireBoth, avgMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final String name,
      required final String description,
      required final String groupId,
      required final String cadence,
      required final int timesPerPeriod,
      required final String dailyMode,
      required final String assignedTo,
      required final bool requireBoth,
      required final int avgMinutes}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get groupId;
  @override
  String get cadence;
  @override
  int get timesPerPeriod;
  @override
  String get dailyMode;
  @override
  String get assignedTo;
  @override
  bool get requireBoth;
  @override
  int get avgMinutes;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
