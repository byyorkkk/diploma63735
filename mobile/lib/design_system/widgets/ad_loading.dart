import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ADProgressIndicator extends StatelessWidget {
  const ADProgressIndicator({
    super.key,
    this.size = 32,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(),
    );
  }
}

class ADLoadingOverlay extends HookWidget {
  const ADLoadingOverlay({
    super.key,
    this.size,
    required this.isLoading,
    this.child,
  });

  final double? size;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: isLoading ? 0.2 : 1,
          child: AbsorbPointer(absorbing: isLoading, child: child),
        ),
        if (isLoading) const ADProgressIndicator(),
      ],
    );
  }
}
