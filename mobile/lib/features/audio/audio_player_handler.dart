import 'package:adhd_project/features/audio/player_data.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class ADAudioHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();

  Stream<PlayerData> get playerDataStream => Rx.combineLatest5(
        _player.playerStateStream,
        _player.positionStream,
        _player.durationStream,
        _player.speedStream,
        _player.playerStateStream,
        (playing, position, duration, speed, playerState) => PlayerData(
          playing: playing.playing,
          position: position,
          duration: duration,
          speed: speed,
          playerState: playerState.processingState,
        ),
      );
  void init() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  Future<void> loadAsset(
    String assetPath,
    Duration? clipEnd,
  ) async {
    await _player.setAsset(assetPath);
    if (clipEnd != null) {
      await _player.setClip(start: Duration.zero, end: clipEnd);
    }
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
