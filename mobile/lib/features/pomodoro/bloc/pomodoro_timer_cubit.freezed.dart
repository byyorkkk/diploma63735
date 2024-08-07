// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PomodoroTimerState {
  ({Duration duration, PomodoroOption option}) get pickedOption =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ({Duration duration, PomodoroOption option}) pickedOption)
        idle,
    required TResult Function(
            ({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft,
            PomodoroTimerRunningStatus status)
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ({Duration duration, PomodoroOption option}) pickedOption)?
        idle,
    TResult? Function(({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft, PomodoroTimerRunningStatus status)?
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({Duration duration, PomodoroOption option}) pickedOption)?
        idle,
    TResult Function(({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft, PomodoroTimerRunningStatus status)?
        running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PomodoroTimerIdle value) idle,
    required TResult Function(PomodoroTimerRunning value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PomodoroTimerIdle value)? idle,
    TResult? Function(PomodoroTimerRunning value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PomodoroTimerIdle value)? idle,
    TResult Function(PomodoroTimerRunning value)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PomodoroTimerStateCopyWith<PomodoroTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroTimerStateCopyWith<$Res> {
  factory $PomodoroTimerStateCopyWith(
          PomodoroTimerState value, $Res Function(PomodoroTimerState) then) =
      _$PomodoroTimerStateCopyWithImpl<$Res, PomodoroTimerState>;
  @useResult
  $Res call({({Duration duration, PomodoroOption option}) pickedOption});
}

/// @nodoc
class _$PomodoroTimerStateCopyWithImpl<$Res, $Val extends PomodoroTimerState>
    implements $PomodoroTimerStateCopyWith<$Res> {
  _$PomodoroTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedOption = null,
  }) {
    return _then(_value.copyWith(
      pickedOption: null == pickedOption
          ? _value.pickedOption
          : pickedOption // ignore: cast_nullable_to_non_nullable
              as ({Duration duration, PomodoroOption option}),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PomodoroTimerIdleCopyWith<$Res>
    implements $PomodoroTimerStateCopyWith<$Res> {
  factory _$$PomodoroTimerIdleCopyWith(
          _$PomodoroTimerIdle value, $Res Function(_$PomodoroTimerIdle) then) =
      __$$PomodoroTimerIdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({({Duration duration, PomodoroOption option}) pickedOption});
}

/// @nodoc
class __$$PomodoroTimerIdleCopyWithImpl<$Res>
    extends _$PomodoroTimerStateCopyWithImpl<$Res, _$PomodoroTimerIdle>
    implements _$$PomodoroTimerIdleCopyWith<$Res> {
  __$$PomodoroTimerIdleCopyWithImpl(
      _$PomodoroTimerIdle _value, $Res Function(_$PomodoroTimerIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedOption = null,
  }) {
    return _then(_$PomodoroTimerIdle(
      pickedOption: null == pickedOption
          ? _value.pickedOption
          : pickedOption // ignore: cast_nullable_to_non_nullable
              as ({Duration duration, PomodoroOption option}),
    ));
  }
}

/// @nodoc

class _$PomodoroTimerIdle
    with DiagnosticableTreeMixin
    implements PomodoroTimerIdle {
  const _$PomodoroTimerIdle({required this.pickedOption});

  @override
  final ({Duration duration, PomodoroOption option}) pickedOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PomodoroTimerState.idle(pickedOption: $pickedOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PomodoroTimerState.idle'))
      ..add(DiagnosticsProperty('pickedOption', pickedOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroTimerIdle &&
            (identical(other.pickedOption, pickedOption) ||
                other.pickedOption == pickedOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroTimerIdleCopyWith<_$PomodoroTimerIdle> get copyWith =>
      __$$PomodoroTimerIdleCopyWithImpl<_$PomodoroTimerIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ({Duration duration, PomodoroOption option}) pickedOption)
        idle,
    required TResult Function(
            ({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft,
            PomodoroTimerRunningStatus status)
        running,
  }) {
    return idle(pickedOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ({Duration duration, PomodoroOption option}) pickedOption)?
        idle,
    TResult? Function(({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft, PomodoroTimerRunningStatus status)?
        running,
  }) {
    return idle?.call(pickedOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({Duration duration, PomodoroOption option}) pickedOption)?
        idle,
    TResult Function(({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft, PomodoroTimerRunningStatus status)?
        running,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(pickedOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PomodoroTimerIdle value) idle,
    required TResult Function(PomodoroTimerRunning value) running,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PomodoroTimerIdle value)? idle,
    TResult? Function(PomodoroTimerRunning value)? running,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PomodoroTimerIdle value)? idle,
    TResult Function(PomodoroTimerRunning value)? running,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class PomodoroTimerIdle implements PomodoroTimerState {
  const factory PomodoroTimerIdle(
      {required final ({
        Duration duration,
        PomodoroOption option
      }) pickedOption}) = _$PomodoroTimerIdle;

  @override
  ({Duration duration, PomodoroOption option}) get pickedOption;
  @override
  @JsonKey(ignore: true)
  _$$PomodoroTimerIdleCopyWith<_$PomodoroTimerIdle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PomodoroTimerRunningCopyWith<$Res>
    implements $PomodoroTimerStateCopyWith<$Res> {
  factory _$$PomodoroTimerRunningCopyWith(_$PomodoroTimerRunning value,
          $Res Function(_$PomodoroTimerRunning) then) =
      __$$PomodoroTimerRunningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {({Duration duration, PomodoroOption option}) pickedOption,
      Duration timeLeft,
      PomodoroTimerRunningStatus status});
}

/// @nodoc
class __$$PomodoroTimerRunningCopyWithImpl<$Res>
    extends _$PomodoroTimerStateCopyWithImpl<$Res, _$PomodoroTimerRunning>
    implements _$$PomodoroTimerRunningCopyWith<$Res> {
  __$$PomodoroTimerRunningCopyWithImpl(_$PomodoroTimerRunning _value,
      $Res Function(_$PomodoroTimerRunning) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedOption = null,
    Object? timeLeft = null,
    Object? status = null,
  }) {
    return _then(_$PomodoroTimerRunning(
      pickedOption: null == pickedOption
          ? _value.pickedOption
          : pickedOption // ignore: cast_nullable_to_non_nullable
              as ({Duration duration, PomodoroOption option}),
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PomodoroTimerRunningStatus,
    ));
  }
}

/// @nodoc

class _$PomodoroTimerRunning
    with DiagnosticableTreeMixin
    implements PomodoroTimerRunning {
  const _$PomodoroTimerRunning(
      {required this.pickedOption,
      required this.timeLeft,
      this.status = PomodoroTimerRunningStatus.running});

  @override
  final ({Duration duration, PomodoroOption option}) pickedOption;
  @override
  final Duration timeLeft;
  @override
  @JsonKey()
  final PomodoroTimerRunningStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PomodoroTimerState.running(pickedOption: $pickedOption, timeLeft: $timeLeft, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PomodoroTimerState.running'))
      ..add(DiagnosticsProperty('pickedOption', pickedOption))
      ..add(DiagnosticsProperty('timeLeft', timeLeft))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroTimerRunning &&
            (identical(other.pickedOption, pickedOption) ||
                other.pickedOption == pickedOption) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedOption, timeLeft, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroTimerRunningCopyWith<_$PomodoroTimerRunning> get copyWith =>
      __$$PomodoroTimerRunningCopyWithImpl<_$PomodoroTimerRunning>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ({Duration duration, PomodoroOption option}) pickedOption)
        idle,
    required TResult Function(
            ({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft,
            PomodoroTimerRunningStatus status)
        running,
  }) {
    return running(pickedOption, timeLeft, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ({Duration duration, PomodoroOption option}) pickedOption)?
        idle,
    TResult? Function(({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft, PomodoroTimerRunningStatus status)?
        running,
  }) {
    return running?.call(pickedOption, timeLeft, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({Duration duration, PomodoroOption option}) pickedOption)?
        idle,
    TResult Function(({Duration duration, PomodoroOption option}) pickedOption,
            Duration timeLeft, PomodoroTimerRunningStatus status)?
        running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(pickedOption, timeLeft, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PomodoroTimerIdle value) idle,
    required TResult Function(PomodoroTimerRunning value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PomodoroTimerIdle value)? idle,
    TResult? Function(PomodoroTimerRunning value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PomodoroTimerIdle value)? idle,
    TResult Function(PomodoroTimerRunning value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class PomodoroTimerRunning implements PomodoroTimerState {
  const factory PomodoroTimerRunning(
      {required final ({Duration duration, PomodoroOption option}) pickedOption,
      required final Duration timeLeft,
      final PomodoroTimerRunningStatus status}) = _$PomodoroTimerRunning;

  @override
  ({Duration duration, PomodoroOption option}) get pickedOption;
  Duration get timeLeft;
  PomodoroTimerRunningStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$PomodoroTimerRunningCopyWith<_$PomodoroTimerRunning> get copyWith =>
      throw _privateConstructorUsedError;
}
