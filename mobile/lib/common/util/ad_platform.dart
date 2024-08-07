import 'package:flutter/foundation.dart';

enum ADPlatform {
  android,
  ios,
  web,
  androidWeb,
  iosWeb,
  other;

  bool get isWeb =>
      [ADPlatform.web, ADPlatform.androidWeb, ADPlatform.iosWeb].contains(this);
  bool get isDesktopWeb => this == ADPlatform.web;
  bool get isMobileWeb =>
      [ADPlatform.iosWeb, ADPlatform.androidWeb].contains(this);

  bool get isAndroid =>
      [ADPlatform.android, ADPlatform.androidWeb].contains(this);
  bool get isIos => [ADPlatform.ios, ADPlatform.iosWeb].contains(this);
  bool get isMobile => [ADPlatform.android, ADPlatform.ios].contains(this);

  static ADPlatform get platform {
    if (kIsWeb) {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return ADPlatform.iosWeb;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        return ADPlatform.androidWeb;
      } else {
        return ADPlatform.web;
      }
    } else {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return ADPlatform.ios;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        return ADPlatform.android;
      } else {
        return ADPlatform.other;
      }
    }
  }
}
