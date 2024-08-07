import 'package:adhd_project/main_common.dart';

import 'config/app_config.dart';

void main() {
  final config = AppConfig(
    apiUri: Uri.parse('https://adhdapi.azurewebsites.net'),
    debugMode: true,
  );

  mainCommon(config);
}
