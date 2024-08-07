import 'dart:async';

import 'package:adhd_project/features/audio/audio_player_handler.dart';
import 'package:adhd_project/features/audio/player_data.dart';
import 'package:adhd_project/features/background_noise/model/background_noise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'play_background_noise_cubit.freezed.dart';

class PlayBackgroundNoiseCubit extends Cubit<PlayBackgroundNoiseState> {
  PlayBackgroundNoiseCubit(this._audioHandler)
      : super(const PlayBackgroundNoiseState.initial());

  final _logger = Logger('PlayBackgroundNoiseCubit');

  final ADAudioHandler _audioHandler;
  StreamSubscription<PlayerData>? _sub;

  Future<void> load({
    required BackgroundNoise backgroundNoise,
    required BackgroundNoiseVersion version,
  }) async {
    emit(const PlayBackgroundNoiseState.loading());

    try {
      await _audioHandler.loadAsset(version.assetPath, version.duration);

      _sub = _audioHandler.playerDataStream.listen((playerData) {
        emit(
          PlayBackgroundNoiseState.loaded(
            backgroundNoise: backgroundNoise,
            playerData: playerData,
          ),
        );
      });
    } catch (e, st) {
      _logger.shout('Could not load background noise', e, st);
      emit(const PlayBackgroundNoiseState.error());
    }
  }

  Future<void> play() async {
    final state = this.state;
    if (state is! PlayBackgroundNoiseLoaded) {
      return;
    }

    await _audioHandler.play();
  }

  Future<void> pause() async {
    final state = this.state;
    if (state is! PlayBackgroundNoiseLoaded) {
      return;
    }

    await _audioHandler.pause();
  }

  Future<void> stop() async {
    final state = this.state;
    if (state is! PlayBackgroundNoiseLoaded) {
      return;
    }

    await _audioHandler.stop();
  }

  Future<void> reset() async {
    final state = this.state;
    if (state is! PlayBackgroundNoiseLoaded) {
      return;
    }

    await _audioHandler.seek(Duration.zero);
  }

  Future<void> clear() async {
    final state = this.state;
    if (state is! PlayBackgroundNoiseLoaded) {
      return;
    }

    await _audioHandler.stop();

    emit(const PlayBackgroundNoiseState.initial());
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    await super.close();
  }
}

@freezed
class PlayBackgroundNoiseState with _$PlayBackgroundNoiseState {
  const factory PlayBackgroundNoiseState.initial() = PlayBackgroundNoiseInitial;
  const factory PlayBackgroundNoiseState.loading() = PlayBackgroundNoiseLoading;
  const factory PlayBackgroundNoiseState.loaded({
    required BackgroundNoise backgroundNoise,
    required PlayerData playerData,
  }) = PlayBackgroundNoiseLoaded;
  const factory PlayBackgroundNoiseState.error() = PlayBackgroundNoiseError;
}
