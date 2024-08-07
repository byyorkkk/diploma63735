import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'player_data.freezed.dart';

@freezed
class PlayerData with _$PlayerData {
  const factory PlayerData({
    required bool playing,
    required Duration position,
    required Duration? duration,
    required double speed,
    required ProcessingState playerState,
  }) = _PlayerData;
}
