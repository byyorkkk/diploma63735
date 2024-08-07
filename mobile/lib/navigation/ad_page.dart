import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<T> buildAdPage<T>({
  LocalKey? key,
  required Widget child,
}) {
  if (kIsWeb) {
    return NoTransitionPage<T>(
      key: key,
      child: child,
    );
  } else {
    return MaterialPage<T>(
      key: key,
      child: child,
    );
  }
}
