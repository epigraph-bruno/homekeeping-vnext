// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  AgendaRules get agendaRules => throw _privateConstructorUsedError;
  GraceSettings get grace => throw _privateConstructorUsedError;
  MetricsSettings get metrics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {AgendaRules agendaRules, GraceSettings grace, MetricsSettings metrics});

  $AgendaRulesCopyWith<$Res> get agendaRules;
  $GraceSettingsCopyWith<$Res> get grace;
  $MetricsSettingsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agendaRules = null,
    Object? grace = null,
    Object? metrics = null,
  }) {
    return _then(_value.copyWith(
      agendaRules: null == agendaRules
          ? _value.agendaRules
          : agendaRules // ignore: cast_nullable_to_non_nullable
              as AgendaRules,
      grace: null == grace
          ? _value.grace
          : grace // ignore: cast_nullable_to_non_nullable
              as GraceSettings,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as MetricsSettings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AgendaRulesCopyWith<$Res> get agendaRules {
    return $AgendaRulesCopyWith<$Res>(_value.agendaRules, (value) {
      return _then(_value.copyWith(agendaRules: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GraceSettingsCopyWith<$Res> get grace {
    return $GraceSettingsCopyWith<$Res>(_value.grace, (value) {
      return _then(_value.copyWith(grace: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetricsSettingsCopyWith<$Res> get metrics {
    return $MetricsSettingsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AgendaRules agendaRules, GraceSettings grace, MetricsSettings metrics});

  @override
  $AgendaRulesCopyWith<$Res> get agendaRules;
  @override
  $GraceSettingsCopyWith<$Res> get grace;
  @override
  $MetricsSettingsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agendaRules = null,
    Object? grace = null,
    Object? metrics = null,
  }) {
    return _then(_$AppSettingsImpl(
      agendaRules: null == agendaRules
          ? _value.agendaRules
          : agendaRules // ignore: cast_nullable_to_non_nullable
              as AgendaRules,
      grace: null == grace
          ? _value.grace
          : grace // ignore: cast_nullable_to_non_nullable
              as GraceSettings,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as MetricsSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl(
      {required this.agendaRules, required this.grace, required this.metrics});

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  @override
  final AgendaRules agendaRules;
  @override
  final GraceSettings grace;
  @override
  final MetricsSettings metrics;

  @override
  String toString() {
    return 'AppSettings(agendaRules: $agendaRules, grace: $grace, metrics: $metrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.agendaRules, agendaRules) ||
                other.agendaRules == agendaRules) &&
            (identical(other.grace, grace) || other.grace == grace) &&
            (identical(other.metrics, metrics) || other.metrics == metrics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, agendaRules, grace, metrics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {required final AgendaRules agendaRules,
      required final GraceSettings grace,
      required final MetricsSettings metrics}) = _$AppSettingsImpl;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  @override
  AgendaRules get agendaRules;
  @override
  GraceSettings get grace;
  @override
  MetricsSettings get metrics;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgendaRules _$AgendaRulesFromJson(Map<String, dynamic> json) {
  return _AgendaRules.fromJson(json);
}

/// @nodoc
mixin _$AgendaRules {
  String get weekStart => throw _privateConstructorUsedError;
  int get rollWeekToTodayDays => throw _privateConstructorUsedError;
  int get rollMonthToWeekDays => throw _privateConstructorUsedError;
  bool get disallowCadencesBeyondMonth => throw _privateConstructorUsedError;
  int get backfillLookbackDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgendaRulesCopyWith<AgendaRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaRulesCopyWith<$Res> {
  factory $AgendaRulesCopyWith(
          AgendaRules value, $Res Function(AgendaRules) then) =
      _$AgendaRulesCopyWithImpl<$Res, AgendaRules>;
  @useResult
  $Res call(
      {String weekStart,
      int rollWeekToTodayDays,
      int rollMonthToWeekDays,
      bool disallowCadencesBeyondMonth,
      int backfillLookbackDays});
}

/// @nodoc
class _$AgendaRulesCopyWithImpl<$Res, $Val extends AgendaRules>
    implements $AgendaRulesCopyWith<$Res> {
  _$AgendaRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStart = null,
    Object? rollWeekToTodayDays = null,
    Object? rollMonthToWeekDays = null,
    Object? disallowCadencesBeyondMonth = null,
    Object? backfillLookbackDays = null,
  }) {
    return _then(_value.copyWith(
      weekStart: null == weekStart
          ? _value.weekStart
          : weekStart // ignore: cast_nullable_to_non_nullable
              as String,
      rollWeekToTodayDays: null == rollWeekToTodayDays
          ? _value.rollWeekToTodayDays
          : rollWeekToTodayDays // ignore: cast_nullable_to_non_nullable
              as int,
      rollMonthToWeekDays: null == rollMonthToWeekDays
          ? _value.rollMonthToWeekDays
          : rollMonthToWeekDays // ignore: cast_nullable_to_non_nullable
              as int,
      disallowCadencesBeyondMonth: null == disallowCadencesBeyondMonth
          ? _value.disallowCadencesBeyondMonth
          : disallowCadencesBeyondMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      backfillLookbackDays: null == backfillLookbackDays
          ? _value.backfillLookbackDays
          : backfillLookbackDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgendaRulesImplCopyWith<$Res>
    implements $AgendaRulesCopyWith<$Res> {
  factory _$$AgendaRulesImplCopyWith(
          _$AgendaRulesImpl value, $Res Function(_$AgendaRulesImpl) then) =
      __$$AgendaRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String weekStart,
      int rollWeekToTodayDays,
      int rollMonthToWeekDays,
      bool disallowCadencesBeyondMonth,
      int backfillLookbackDays});
}

/// @nodoc
class __$$AgendaRulesImplCopyWithImpl<$Res>
    extends _$AgendaRulesCopyWithImpl<$Res, _$AgendaRulesImpl>
    implements _$$AgendaRulesImplCopyWith<$Res> {
  __$$AgendaRulesImplCopyWithImpl(
      _$AgendaRulesImpl _value, $Res Function(_$AgendaRulesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStart = null,
    Object? rollWeekToTodayDays = null,
    Object? rollMonthToWeekDays = null,
    Object? disallowCadencesBeyondMonth = null,
    Object? backfillLookbackDays = null,
  }) {
    return _then(_$AgendaRulesImpl(
      weekStart: null == weekStart
          ? _value.weekStart
          : weekStart // ignore: cast_nullable_to_non_nullable
              as String,
      rollWeekToTodayDays: null == rollWeekToTodayDays
          ? _value.rollWeekToTodayDays
          : rollWeekToTodayDays // ignore: cast_nullable_to_non_nullable
              as int,
      rollMonthToWeekDays: null == rollMonthToWeekDays
          ? _value.rollMonthToWeekDays
          : rollMonthToWeekDays // ignore: cast_nullable_to_non_nullable
              as int,
      disallowCadencesBeyondMonth: null == disallowCadencesBeyondMonth
          ? _value.disallowCadencesBeyondMonth
          : disallowCadencesBeyondMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      backfillLookbackDays: null == backfillLookbackDays
          ? _value.backfillLookbackDays
          : backfillLookbackDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgendaRulesImpl implements _AgendaRules {
  const _$AgendaRulesImpl(
      {required this.weekStart,
      required this.rollWeekToTodayDays,
      required this.rollMonthToWeekDays,
      required this.disallowCadencesBeyondMonth,
      this.backfillLookbackDays = 90});

  factory _$AgendaRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgendaRulesImplFromJson(json);

  @override
  final String weekStart;
  @override
  final int rollWeekToTodayDays;
  @override
  final int rollMonthToWeekDays;
  @override
  final bool disallowCadencesBeyondMonth;
  @override
  @JsonKey()
  final int backfillLookbackDays;

  @override
  String toString() {
    return 'AgendaRules(weekStart: $weekStart, rollWeekToTodayDays: $rollWeekToTodayDays, rollMonthToWeekDays: $rollMonthToWeekDays, disallowCadencesBeyondMonth: $disallowCadencesBeyondMonth, backfillLookbackDays: $backfillLookbackDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgendaRulesImpl &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            (identical(other.rollWeekToTodayDays, rollWeekToTodayDays) ||
                other.rollWeekToTodayDays == rollWeekToTodayDays) &&
            (identical(other.rollMonthToWeekDays, rollMonthToWeekDays) ||
                other.rollMonthToWeekDays == rollMonthToWeekDays) &&
            (identical(other.disallowCadencesBeyondMonth,
                    disallowCadencesBeyondMonth) ||
                other.disallowCadencesBeyondMonth ==
                    disallowCadencesBeyondMonth) &&
            (identical(other.backfillLookbackDays, backfillLookbackDays) ||
                other.backfillLookbackDays == backfillLookbackDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weekStart, rollWeekToTodayDays,
      rollMonthToWeekDays, disallowCadencesBeyondMonth, backfillLookbackDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgendaRulesImplCopyWith<_$AgendaRulesImpl> get copyWith =>
      __$$AgendaRulesImplCopyWithImpl<_$AgendaRulesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgendaRulesImplToJson(
      this,
    );
  }
}

abstract class _AgendaRules implements AgendaRules {
  const factory _AgendaRules(
      {required final String weekStart,
      required final int rollWeekToTodayDays,
      required final int rollMonthToWeekDays,
      required final bool disallowCadencesBeyondMonth,
      final int backfillLookbackDays}) = _$AgendaRulesImpl;

  factory _AgendaRules.fromJson(Map<String, dynamic> json) =
      _$AgendaRulesImpl.fromJson;

  @override
  String get weekStart;
  @override
  int get rollWeekToTodayDays;
  @override
  int get rollMonthToWeekDays;
  @override
  bool get disallowCadencesBeyondMonth;
  @override
  int get backfillLookbackDays;
  @override
  @JsonKey(ignore: true)
  _$$AgendaRulesImplCopyWith<_$AgendaRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GraceSettings _$GraceSettingsFromJson(Map<String, dynamic> json) {
  return _GraceSettings.fromJson(json);
}

/// @nodoc
mixin _$GraceSettings {
  int get daily => throw _privateConstructorUsedError;
  int get weekly => throw _privateConstructorUsedError;
  int get monthly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraceSettingsCopyWith<GraceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraceSettingsCopyWith<$Res> {
  factory $GraceSettingsCopyWith(
          GraceSettings value, $Res Function(GraceSettings) then) =
      _$GraceSettingsCopyWithImpl<$Res, GraceSettings>;
  @useResult
  $Res call({int daily, int weekly, int monthly});
}

/// @nodoc
class _$GraceSettingsCopyWithImpl<$Res, $Val extends GraceSettings>
    implements $GraceSettingsCopyWith<$Res> {
  _$GraceSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
  }) {
    return _then(_value.copyWith(
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraceSettingsImplCopyWith<$Res>
    implements $GraceSettingsCopyWith<$Res> {
  factory _$$GraceSettingsImplCopyWith(
          _$GraceSettingsImpl value, $Res Function(_$GraceSettingsImpl) then) =
      __$$GraceSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int daily, int weekly, int monthly});
}

/// @nodoc
class __$$GraceSettingsImplCopyWithImpl<$Res>
    extends _$GraceSettingsCopyWithImpl<$Res, _$GraceSettingsImpl>
    implements _$$GraceSettingsImplCopyWith<$Res> {
  __$$GraceSettingsImplCopyWithImpl(
      _$GraceSettingsImpl _value, $Res Function(_$GraceSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
  }) {
    return _then(_$GraceSettingsImpl(
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GraceSettingsImpl implements _GraceSettings {
  const _$GraceSettingsImpl(
      {required this.daily, required this.weekly, required this.monthly});

  factory _$GraceSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraceSettingsImplFromJson(json);

  @override
  final int daily;
  @override
  final int weekly;
  @override
  final int monthly;

  @override
  String toString() {
    return 'GraceSettings(daily: $daily, weekly: $weekly, monthly: $monthly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraceSettingsImpl &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, daily, weekly, monthly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraceSettingsImplCopyWith<_$GraceSettingsImpl> get copyWith =>
      __$$GraceSettingsImplCopyWithImpl<_$GraceSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraceSettingsImplToJson(
      this,
    );
  }
}

abstract class _GraceSettings implements GraceSettings {
  const factory _GraceSettings(
      {required final int daily,
      required final int weekly,
      required final int monthly}) = _$GraceSettingsImpl;

  factory _GraceSettings.fromJson(Map<String, dynamic> json) =
      _$GraceSettingsImpl.fromJson;

  @override
  int get daily;
  @override
  int get weekly;
  @override
  int get monthly;
  @override
  @JsonKey(ignore: true)
  _$$GraceSettingsImplCopyWith<_$GraceSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetricsSettings _$MetricsSettingsFromJson(Map<String, dynamic> json) {
  return _MetricsSettings.fromJson(json);
}

/// @nodoc
mixin _$MetricsSettings {
  bool get enableSimpleWeeklyPulse => throw _privateConstructorUsedError;
  bool get includeIndividualInGlobal => throw _privateConstructorUsedError;
  double get hoursPerTapDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetricsSettingsCopyWith<MetricsSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricsSettingsCopyWith<$Res> {
  factory $MetricsSettingsCopyWith(
          MetricsSettings value, $Res Function(MetricsSettings) then) =
      _$MetricsSettingsCopyWithImpl<$Res, MetricsSettings>;
  @useResult
  $Res call(
      {bool enableSimpleWeeklyPulse,
      bool includeIndividualInGlobal,
      double hoursPerTapDefault});
}

/// @nodoc
class _$MetricsSettingsCopyWithImpl<$Res, $Val extends MetricsSettings>
    implements $MetricsSettingsCopyWith<$Res> {
  _$MetricsSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableSimpleWeeklyPulse = null,
    Object? includeIndividualInGlobal = null,
    Object? hoursPerTapDefault = null,
  }) {
    return _then(_value.copyWith(
      enableSimpleWeeklyPulse: null == enableSimpleWeeklyPulse
          ? _value.enableSimpleWeeklyPulse
          : enableSimpleWeeklyPulse // ignore: cast_nullable_to_non_nullable
              as bool,
      includeIndividualInGlobal: null == includeIndividualInGlobal
          ? _value.includeIndividualInGlobal
          : includeIndividualInGlobal // ignore: cast_nullable_to_non_nullable
              as bool,
      hoursPerTapDefault: null == hoursPerTapDefault
          ? _value.hoursPerTapDefault
          : hoursPerTapDefault // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetricsSettingsImplCopyWith<$Res>
    implements $MetricsSettingsCopyWith<$Res> {
  factory _$$MetricsSettingsImplCopyWith(_$MetricsSettingsImpl value,
          $Res Function(_$MetricsSettingsImpl) then) =
      __$$MetricsSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enableSimpleWeeklyPulse,
      bool includeIndividualInGlobal,
      double hoursPerTapDefault});
}

/// @nodoc
class __$$MetricsSettingsImplCopyWithImpl<$Res>
    extends _$MetricsSettingsCopyWithImpl<$Res, _$MetricsSettingsImpl>
    implements _$$MetricsSettingsImplCopyWith<$Res> {
  __$$MetricsSettingsImplCopyWithImpl(
      _$MetricsSettingsImpl _value, $Res Function(_$MetricsSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableSimpleWeeklyPulse = null,
    Object? includeIndividualInGlobal = null,
    Object? hoursPerTapDefault = null,
  }) {
    return _then(_$MetricsSettingsImpl(
      enableSimpleWeeklyPulse: null == enableSimpleWeeklyPulse
          ? _value.enableSimpleWeeklyPulse
          : enableSimpleWeeklyPulse // ignore: cast_nullable_to_non_nullable
              as bool,
      includeIndividualInGlobal: null == includeIndividualInGlobal
          ? _value.includeIndividualInGlobal
          : includeIndividualInGlobal // ignore: cast_nullable_to_non_nullable
              as bool,
      hoursPerTapDefault: null == hoursPerTapDefault
          ? _value.hoursPerTapDefault
          : hoursPerTapDefault // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricsSettingsImpl implements _MetricsSettings {
  const _$MetricsSettingsImpl(
      {required this.enableSimpleWeeklyPulse,
      required this.includeIndividualInGlobal,
      required this.hoursPerTapDefault});

  factory _$MetricsSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricsSettingsImplFromJson(json);

  @override
  final bool enableSimpleWeeklyPulse;
  @override
  final bool includeIndividualInGlobal;
  @override
  final double hoursPerTapDefault;

  @override
  String toString() {
    return 'MetricsSettings(enableSimpleWeeklyPulse: $enableSimpleWeeklyPulse, includeIndividualInGlobal: $includeIndividualInGlobal, hoursPerTapDefault: $hoursPerTapDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricsSettingsImpl &&
            (identical(
                    other.enableSimpleWeeklyPulse, enableSimpleWeeklyPulse) ||
                other.enableSimpleWeeklyPulse == enableSimpleWeeklyPulse) &&
            (identical(other.includeIndividualInGlobal,
                    includeIndividualInGlobal) ||
                other.includeIndividualInGlobal == includeIndividualInGlobal) &&
            (identical(other.hoursPerTapDefault, hoursPerTapDefault) ||
                other.hoursPerTapDefault == hoursPerTapDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enableSimpleWeeklyPulse,
      includeIndividualInGlobal, hoursPerTapDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricsSettingsImplCopyWith<_$MetricsSettingsImpl> get copyWith =>
      __$$MetricsSettingsImplCopyWithImpl<_$MetricsSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricsSettingsImplToJson(
      this,
    );
  }
}

abstract class _MetricsSettings implements MetricsSettings {
  const factory _MetricsSettings(
      {required final bool enableSimpleWeeklyPulse,
      required final bool includeIndividualInGlobal,
      required final double hoursPerTapDefault}) = _$MetricsSettingsImpl;

  factory _MetricsSettings.fromJson(Map<String, dynamic> json) =
      _$MetricsSettingsImpl.fromJson;

  @override
  bool get enableSimpleWeeklyPulse;
  @override
  bool get includeIndividualInGlobal;
  @override
  double get hoursPerTapDefault;
  @override
  @JsonKey(ignore: true)
  _$$MetricsSettingsImplCopyWith<_$MetricsSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
