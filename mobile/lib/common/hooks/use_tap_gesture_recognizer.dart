import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TapGestureRecognizer useTapGestureRecognizer({
  required VoidCallback onTap,
}) {
  final recognizer = useMemoized(
    () => TapGestureRecognizer()..onTap = onTap,
    [onTap],
  );

  useEffect(() => recognizer.dispose);

  return recognizer;
}
