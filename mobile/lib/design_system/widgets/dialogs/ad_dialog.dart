import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ADDialog extends StatelessWidget {
  const ADDialog({
    super.key,
    required this.title,
    required this.actions,
    required this.body,
  });

  final String title;
  final Widget body;
  final List<ADDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    return Dialog(
      backgroundColor: colors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: colors.background,
          ),
          constraints: const BoxConstraints(
            minWidth: 240,
            maxHeight: 280,
          ),
          child: Column(
            children: [
              ADText(title, style: ADTextStyle.h4),
              const SizedBox(height: 16),
              Divider(
                height: 1,
                color: colors.backgroundSecondary,
              ),
              const SizedBox(height: 24),
              DefaultTextStyle(
                style:
                    ADTextStyle.bodyLarge.copyWith(color: colors.textSecondary),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: body,
                ),
              ),
              const SizedBox(height: 24),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions
                    .mapIndexed(
                      (i, e) => [
                        if (i != 0) const SizedBox(width: 12),
                        Expanded(child: e),
                      ],
                    )
                    .expand((e) => e)
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _ADDialogActionType { primary, secondary }

class ADDialogAction extends StatelessWidget {
  const ADDialogAction.primary({
    super.key,
    required this.text,
    required this.onPressed,
  }) : type = _ADDialogActionType.primary;

  const ADDialogAction.secondary({
    super.key,
    required this.text,
    required this.onPressed,
  }) : type = _ADDialogActionType.secondary;

  final String text;
  final VoidCallback? onPressed;
  final _ADDialogActionType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      _ADDialogActionType.primary => ADPrimaryButton(
          label: text,
          onPressed: onPressed,
        ),
      _ADDialogActionType.secondary => ADSecondaryButton(
          label: text,
          onPressed: onPressed,
        ),
    };
  }
}
