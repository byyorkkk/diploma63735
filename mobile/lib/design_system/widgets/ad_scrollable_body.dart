import 'package:flutter/material.dart';

/// Allows to divide free space between [content] and [action] on larger screens
/// while using [SingleChildScrollView] for smaller screens support.
/// The [separator] widget is placed just after [content] and before free space.
/// On smaller screen [separator] will directly divide [content] from [action].
/// If [action] is null, widget renders scrollable body with bottom padding of
/// [bottomSafeAreaPadding] or 0 for null.
class ADScrollableBody extends StatelessWidget {
  const ADScrollableBody({
    super.key,
    required this.content,
    this.action,
    this.separator = const SizedBox(height: 32),
    this.horizontalPadding = 24,
    this.bottomSafeAreaPadding = 32,
  });

  final Widget content;
  final Widget? action;
  final Widget separator;
  final double horizontalPadding;
  final double? bottomSafeAreaPadding;

  @override
  Widget build(BuildContext context) {
    final bottomSafeAreaPadding = this.bottomSafeAreaPadding;

    final effectiveAction = action ?? const SizedBox();

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    content,
                    if (action != null) separator,
                  ],
                ),
                if (bottomSafeAreaPadding != null)
                  SafeArea(
                    minimum: EdgeInsets.only(bottom: bottomSafeAreaPadding),
                    top: false,
                    right: false,
                    left: false,
                    child: effectiveAction,
                  )
                else
                  effectiveAction,
              ],
            ),
          ),
        );
      },
    );
  }
}
