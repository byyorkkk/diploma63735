import 'package:flutter/material.dart';

class ADOpacityPageProgressIndicator extends StatelessWidget {
  const ADOpacityPageProgressIndicator({
    super.key,
    required this.inProgress,
    required this.child,
  });

  final bool inProgress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: inProgress,
      child: Stack(
        children: [
          child,
          if (inProgress)
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.2)
                    : Colors.white.withOpacity(0.15),
                child: const CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
