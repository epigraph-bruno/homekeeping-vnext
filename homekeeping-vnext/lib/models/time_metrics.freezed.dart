// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeByGroup _$TimeByGroupFromJson(Map<String, dynamic> json) {
  return _TimeByGroup.fromJson(json);
}

/// @nodoc
mixin _$TimeByGroup {
  String get groupId => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  double get hours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeByGroupCopyWith<TimeByGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeByGroupCopyWith<$Res> {
  factory $TimeByGroupCopyWith(
          TimeByGroup value, $Res Function(TimeByGroup) then) =
      _$TimeByGroupCopyWithImpl<$Res, TimeByGroup>;
  @useResult
  $Res call({String groupId, String groupName, double hours});
}

/// @nodoc
class _$TimeByGroupCopyWithImpl<$Res, $Val extends TimeByGroup>
    implements $TimeByGroupCopyWith<$Res> {
  _$TimeByGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? groupName = null,
    Object? hours = null,
  }) {
    return _then(_value.copyWith(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeByGroupImplCopyWith<$Res>
    implements $TimeByGroupCopyWith<$Res> {
  factory _$$TimeByGroupImplCopyWith(
          _$TimeByGroupImpl value, $Res Function(_$TimeByGroupImpl) then) =
      __$$TimeByGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, String groupName, double hours});
}

/// @nodoc
class __$$TimeByGroupImplCopyWithImpl<$Res>
    extends _$TimeByGroupCopyWithImpl<$Res, _$TimeByGroupImpl>
    implements _$$TimeByGroupImplCopyWith<$Res> {
  __$$TimeByGroupImplCopyWithImpl(
      _$TimeByGroupImpl _value, $Res Function(_$TimeByGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? groupName = null,
    Object? hours = null,
  }) {
    return _then(_$TimeByGroupImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeByGroupImpl implements _TimeByGroup {
  const _$TimeByGroupImpl(
      {required this.groupId, required this.groupName, required this.hours});

  factory _$TimeByGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeByGroupImplFromJson(json);

  @override
  final String groupId;
  @override
  final String groupName;
  @override
  final double hours;

  @override
  String toString() {
    return 'TimeByGroup(groupId: $groupId, groupName: $groupName, hours: $hours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeByGroupImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.hours, hours) || other.hours == hours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, groupName, hours);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeByGroupImplCopyWith<_$TimeByGroupImpl> get copyWith =>
      __$$TimeByGroupImplCopyWithImpl<_$TimeByGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeByGroupImplToJson(
      this,
    );
  }
}

abstract class _TimeByGroup implements TimeByGroup {
  const factory _TimeByGroup(
      {required final String groupId,
      required final String groupName,
      required final double hours}) = _$TimeByGroupImpl;

  factory _TimeByGroup.fromJson(Map<String, dynamic> json) =
      _$TimeByGroupImpl.fromJson;

  @override
  String get groupId;
  @override
  String get groupName;
  @override
  double get hours;
  @override
  @JsonKey(ignore: true)
  _$$TimeByGroupImplCopyWith<_$TimeByGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeByPerson _$TimeByPersonFromJson(Map<String, dynamic> json) {
  return _TimeByPerson.fromJson(json);
}

/// @nodoc
mixin _$TimeByPerson {
  String get userCode => throw _privateConstructorUsedError;
  double get hours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeByPersonCopyWith<TimeByPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeByPersonCopyWith<$Res> {
  factory $TimeByPersonCopyWith(
          TimeByPerson value, $Res Function(TimeByPerson) then) =
      _$TimeByPersonCopyWithImpl<$Res, TimeByPerson>;
  @useResult
  $Res call({String userCode, double hours});
}

/// @nodoc
class _$TimeByPersonCopyWithImpl<$Res, $Val extends TimeByPerson>
    implements $TimeByPersonCopyWith<$Res> {
  _$TimeByPersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCode = null,
    Object? hours = null,
  }) {
    return _then(_value.copyWith(
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeByPersonImplCopyWith<$Res>
    implements $TimeByPersonCopyWith<$Res> {
  factory _$$TimeByPersonImplCopyWith(
          _$TimeByPersonImpl value, $Res Function(_$TimeByPersonImpl) then) =
      __$$TimeByPersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userCode, double hours});
}

/// @nodoc
class __$$TimeByPersonImplCopyWithImpl<$Res>
    extends _$TimeByPersonCopyWithImpl<$Res, _$TimeByPersonImpl>
    implements _$$TimeByPersonImplCopyWith<$Res> {
  __$$TimeByPersonImplCopyWithImpl(
      _$TimeByPersonImpl _value, $Res Function(_$TimeByPersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCode = null,
    Object? hours = null,
  }) {
    return _then(_$TimeByPersonImpl(
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeByPersonImpl implements _TimeByPerson {
  const _$TimeByPersonImpl({required this.userCode, required this.hours});

  factory _$TimeByPersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeByPersonImplFromJson(json);

  @override
  final String userCode;
  @override
  final double hours;

  @override
  String toString() {
    return 'TimeByPerson(userCode: $userCode, hours: $hours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeByPersonImpl &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode) &&
            (identical(other.hours, hours) || other.hours == hours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userCode, hours);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeByPersonImplCopyWith<_$TimeByPersonImpl> get copyWith =>
      __$$TimeByPersonImplCopyWithImpl<_$TimeByPersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeByPersonImplToJson(
      this,
    );
  }
}

abstract class _TimeByPerson implements TimeByPerson {
  const factory _TimeByPerson(
      {required final String userCode,
      required final double hours}) = _$TimeByPersonImpl;

  factory _TimeByPerson.fromJson(Map<String, dynamic> json) =
      _$TimeByPersonImpl.fromJson;

  @override
  String get userCode;
  @override
  double get hours;
  @override
  @JsonKey(ignore: true)
  _$$TimeByPersonImplCopyWith<_$TimeByPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeMetrics _$TimeMetricsFromJson(Map<String, dynamic> json) {
  return _TimeMetrics.fromJson(json);
}

/// @nodoc
mixin _$TimeMetrics {
  List<TimeByGroup> get byGroup => throw _privateConstructorUsedError;
  List<TimeByPerson> get byPerson => throw _privateConstructorUsedError;
  double get ungroupedHours => throw _privateConstructorUsedError;
  double get totalHours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeMetricsCopyWith<TimeMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeMetricsCopyWith<$Res> {
  factory $TimeMetricsCopyWith(
          TimeMetrics value, $Res Function(TimeMetrics) then) =
      _$TimeMetricsCopyWithImpl<$Res, TimeMetrics>;
  @useResult
  $Res call(
      {List<TimeByGroup> byGroup,
      List<TimeByPerson> byPerson,
      double ungroupedHours,
      double totalHours});
}

/// @nodoc
class _$TimeMetricsCopyWithImpl<$Res, $Val extends TimeMetrics>
    implements $TimeMetricsCopyWith<$Res> {
  _$TimeMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? byGroup = null,
    Object? byPerson = null,
    Object? ungroupedHours = null,
    Object? totalHours = null,
  }) {
    return _then(_value.copyWith(
      byGroup: null == byGroup
          ? _value.byGroup
          : byGroup // ignore: cast_nullable_to_non_nullable
              as List<TimeByGroup>,
      byPerson: null == byPerson
          ? _value.byPerson
          : byPerson // ignore: cast_nullable_to_non_nullable
              as List<TimeByPerson>,
      ungroupedHours: null == ungroupedHours
          ? _value.ungroupedHours
          : ungroupedHours // ignore: cast_nullable_to_non_nullable
              as double,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeMetricsImplCopyWith<$Res>
    implements $TimeMetricsCopyWith<$Res> {
  factory _$$TimeMetricsImplCopyWith(
          _$TimeMetricsImpl value, $Res Function(_$TimeMetricsImpl) then) =
      __$$TimeMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TimeByGroup> byGroup,
      List<TimeByPerson> byPerson,
      double ungroupedHours,
      double totalHours});
}

/// @nodoc
class __$$TimeMetricsImplCopyWithImpl<$Res>
    extends _$TimeMetricsCopyWithImpl<$Res, _$TimeMetricsImpl>
    implements _$$TimeMetricsImplCopyWith<$Res> {
  __$$TimeMetricsImplCopyWithImpl(
      _$TimeMetricsImpl _value, $Res Function(_$TimeMetricsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? byGroup = null,
    Object? byPerson = null,
    Object? ungroupedHours = null,
    Object? totalHours = null,
  }) {
    return _then(_$TimeMetricsImpl(
      byGroup: null == byGroup
          ? _value._byGroup
          : byGroup // ignore: cast_nullable_to_non_nullable
              as List<TimeByGroup>,
      byPerson: null == byPerson
          ? _value._byPerson
          : byPerson // ignore: cast_nullable_to_non_nullable
              as List<TimeByPerson>,
      ungroupedHours: null == ungroupedHours
          ? _value.ungroupedHours
          : ungroupedHours // ignore: cast_nullable_to_non_nullable
              as double,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeMetricsImpl implements _TimeMetrics {
  const _$TimeMetricsImpl(
      {required final List<TimeByGroup> byGroup,
      required final List<TimeByPerson> byPerson,
      required this.ungroupedHours,
      required this.totalHours})
      : _byGroup = byGroup,
        _byPerson = byPerson;

  factory _$TimeMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeMetricsImplFromJson(json);

  final List<TimeByGroup> _byGroup;
  @override
  List<TimeByGroup> get byGroup {
    if (_byGroup is EqualUnmodifiableListView) return _byGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byGroup);
  }

  final List<TimeByPerson> _byPerson;
  @override
  List<TimeByPerson> get byPerson {
    if (_byPerson is EqualUnmodifiableListView) return _byPerson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byPerson);
  }

  @override
  final double ungroupedHours;
  @override
  final double totalHours;

  @override
  String toString() {
    return 'TimeMetrics(byGroup: $byGroup, byPerson: $byPerson, ungroupedHours: $ungroupedHours, totalHours: $totalHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeMetricsImpl &&
            const DeepCollectionEquality().equals(other._byGroup, _byGroup) &&
            const DeepCollectionEquality().equals(other._byPerson, _byPerson) &&
            (identical(other.ungroupedHours, ungroupedHours) ||
                other.ungroupedHours == ungroupedHours) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_byGroup),
      const DeepCollectionEquality().hash(_byPerson),
      ungroupedHours,
      totalHours);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeMetricsImplCopyWith<_$TimeMetricsImpl> get copyWith =>
      __$$TimeMetricsImplCopyWithImpl<_$TimeMetricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeMetricsImplToJson(
      this,
    );
  }
}

abstract class _TimeMetrics implements TimeMetrics {
  const factory _TimeMetrics(
      {required final List<TimeByGroup> byGroup,
      required final List<TimeByPerson> byPerson,
      required final double ungroupedHours,
      required final double totalHours}) = _$TimeMetricsImpl;

  factory _TimeMetrics.fromJson(Map<String, dynamic> json) =
      _$TimeMetricsImpl.fromJson;

  @override
  List<TimeByGroup> get byGroup;
  @override
  List<TimeByPerson> get byPerson;
  @override
  double get ungroupedHours;
  @override
  double get totalHours;
  @override
  @JsonKey(ignore: true)
  _$$TimeMetricsImplCopyWith<_$TimeMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
