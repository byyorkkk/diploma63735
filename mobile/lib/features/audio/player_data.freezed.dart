// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerData {
  bool get playing => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  ProcessingState get playerState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerDataCopyWith<PlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDataCopyWith<$Res> {
  factory $PlayerDataCopyWith(
          PlayerData value, $Res Function(PlayerData) then) =
      _$PlayerDataCopyWithImpl<$Res, PlayerData>;
  @useResult
  $Res call(
      {bool playing,
      Duration position,
      Duration? duration,
      double speed,
      ProcessingState playerState});
}

/// @nodoc
class _$PlayerDataCopyWithImpl<$Res, $Val extends PlayerData>
    implements $PlayerDataCopyWith<$Res> {
  _$PlayerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playing = null,
    Object? position = null,
    Object? duration = freezed,
    Object? speed = null,
    Object? playerState = null,
  }) {
    return _then(_value.copyWith(
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      playerState: null == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerDataCopyWith<$Res>
    implements $PlayerDataCopyWith<$Res> {
  factory _$$_PlayerDataCopyWith(
          _$_PlayerData value, $Res Function(_$_PlayerData) then) =
      __$$_PlayerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool playing,
      Duration position,
      Duration? duration,
      double speed,
      ProcessingState playerState});
}

/// @nodoc
class __$$_PlayerDataCopyWithImpl<$Res>
    extends _$PlayerDataCopyWithImpl<$Res, _$_PlayerData>
    implements _$$_PlayerDataCopyWith<$Res> {
  __$$_PlayerDataCopyWithImpl(
      _$_PlayerData _value, $Res Function(_$_PlayerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playing = null,
    Object? position = null,
    Object? duration = freezed,
    Object? speed = null,
    Object? playerState = null,
  }) {
    return _then(_$_PlayerData(
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      playerState: null == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
    ));
  }
}

/// @nodoc

class _$_PlayerData implements _PlayerData {
  const _$_PlayerData(
      {required this.playing,
      required this.position,
      required this.duration,
      required this.speed,
      required this.playerState});

  @override
  final bool playing;
  @override
  final Duration position;
  @override
  final Duration? duration;
  @override
  final double speed;
  @override
  final ProcessingState playerState;

  @override
  String toString() {
    return 'PlayerData(playing: $playing, position: $position, duration: $duration, speed: $speed, playerState: $playerState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerData &&
            (identical(other.playing, playing) || other.playing == playing) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, playing, position, duration, speed, playerState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerDataCopyWith<_$_PlayerData> get copyWith =>
      __$$_PlayerDataCopyWithImpl<_$_PlayerData>(this, _$identity);
}

abstract class _PlayerData implements PlayerData {
  const factory _PlayerData(
      {required final bool playing,
      required final Duration position,
      required final Duration? duration,
      required final double speed,
      required final ProcessingState playerState}) = _$_PlayerData;

  @override
  bool get playing;
  @override
  Duration get position;
  @override
  Duration? get duration;
  @override
  double get speed;
  @override
  ProcessingState get playerState;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerDataCopyWith<_$_PlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}
