import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/audio/audio_player_handler.dart';
import 'package:audio_service/audio_service.dart';

Future<ADAudioHandler> initAudioService() {
  return AudioService.init(
    builder: ADAudioHandler.new,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'pl.byyorkkk.adhd.channel.audio',
      androidNotificationChannelName: 'ADHD Audio Service',
      androidNotificationChannelDescription:
          'This service enables playing audio in background',
      notificationColor: ADColors.accent500,
    ),
  );
}
