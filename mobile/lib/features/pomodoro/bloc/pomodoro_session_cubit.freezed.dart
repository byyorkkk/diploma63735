// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PomodoroSessionState {
  TaskDto? get task => throw _privateConstructorUsedError;
  int get roundsCount => throw _privateConstructorUsedError;

  /// Number of current round in range from 1 to [roundsCount] inclusive
  int get currentRound => throw _privateConstructorUsedError;
  bool get awaitsPickingBreakLengthOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PomodoroSessionStateCopyWith<PomodoroSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroSessionStateCopyWith<$Res> {
  factory $PomodoroSessionStateCopyWith(PomodoroSessionState value,
          $Res Function(PomodoroSessionState) then) =
      _$PomodoroSessionStateCopyWithImpl<$Res, PomodoroSessionState>;
  @useResult
  $Res call(
      {TaskDto? task,
      int roundsCount,
      int currentRound,
      bool awaitsPickingBreakLengthOption});
}

/// @nodoc
class _$PomodoroSessionStateCopyWithImpl<$Res,
        $Val extends PomodoroSessionState>
    implements $PomodoroSessionStateCopyWith<$Res> {
  _$PomodoroSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? roundsCount = null,
    Object? currentRound = null,
    Object? awaitsPickingBreakLengthOption = null,
  }) {
    return _then(_value.copyWith(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskDto?,
      roundsCount: null == roundsCount
          ? _value.roundsCount
          : roundsCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      awaitsPickingBreakLengthOption: null == awaitsPickingBreakLengthOption
          ? _value.awaitsPickingBreakLengthOption
          : awaitsPickingBreakLengthOption // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PomodoroSessionStateCopyWith<$Res>
    implements $PomodoroSessionStateCopyWith<$Res> {
  factory _$$_PomodoroSessionStateCopyWith(_$_PomodoroSessionState value,
          $Res Function(_$_PomodoroSessionState) then) =
      __$$_PomodoroSessionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskDto? task,
      int roundsCount,
      int currentRound,
      bool awaitsPickingBreakLengthOption});
}

/// @nodoc
class __$$_PomodoroSessionStateCopyWithImpl<$Res>
    extends _$PomodoroSessionStateCopyWithImpl<$Res, _$_PomodoroSessionState>
    implements _$$_PomodoroSessionStateCopyWith<$Res> {
  __$$_PomodoroSessionStateCopyWithImpl(_$_PomodoroSessionState _value,
      $Res Function(_$_PomodoroSessionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? roundsCount = null,
    Object? currentRound = null,
    Object? awaitsPickingBreakLengthOption = null,
  }) {
    return _then(_$_PomodoroSessionState(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskDto?,
      roundsCount: null == roundsCount
          ? _value.roundsCount
          : roundsCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      awaitsPickingBreakLengthOption: null == awaitsPickingBreakLengthOption
          ? _value.awaitsPickingBreakLengthOption
          : awaitsPickingBreakLengthOption // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PomodoroSessionState implements _PomodoroSessionState {
  const _$_PomodoroSessionState(
      {this.task,
      required this.roundsCount,
      required this.currentRound,
      this.awaitsPickingBreakLengthOption = false});

  @override
  final TaskDto? task;
  @override
  final int roundsCount;

  /// Number of current round in range from 1 to [roundsCount] inclusive
  @override
  final int currentRound;
  @override
  @JsonKey()
  final bool awaitsPickingBreakLengthOption;

  @override
  String toString() {
    return 'PomodoroSessionState(task: $task, roundsCount: $roundsCount, currentRound: $currentRound, awaitsPickingBreakLengthOption: $awaitsPickingBreakLengthOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PomodoroSessionState &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.roundsCount, roundsCount) ||
                other.roundsCount == roundsCount) &&
            (identical(other.currentRound, currentRound) ||
                other.currentRound == currentRound) &&
            (identical(other.awaitsPickingBreakLengthOption,
                    awaitsPickingBreakLengthOption) ||
                other.awaitsPickingBreakLengthOption ==
                    awaitsPickingBreakLengthOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, roundsCount, currentRound,
      awaitsPickingBreakLengthOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PomodoroSessionStateCopyWith<_$_PomodoroSessionState> get copyWith =>
      __$$_PomodoroSessionStateCopyWithImpl<_$_PomodoroSessionState>(
          this, _$identity);
}

abstract class _PomodoroSessionState implements PomodoroSessionState {
  const factory _PomodoroSessionState(
      {final TaskDto? task,
      required final int roundsCount,
      required final int currentRound,
      final bool awaitsPickingBreakLengthOption}) = _$_PomodoroSessionState;

  @override
  TaskDto? get task;
  @override
  int get roundsCount;
  @override

  /// Number of current round in range from 1 to [roundsCount] inclusive
  int get currentRound;
  @override
  bool get awaitsPickingBreakLengthOption;
  @override
  @JsonKey(ignore: true)
  _$$_PomodoroSessionStateCopyWith<_$_PomodoroSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}
