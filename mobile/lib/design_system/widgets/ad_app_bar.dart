import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ADAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ADAppBar({
    super.key,
    this.leading,
    this.title,
    this.action,
    this.automaticallyImplyLeading = true,
  });

  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final navigator = GoRouter.of(context);

    final effectiveLeading = leading ??
        (automaticallyImplyLeading && navigator.canPop()
            ? const ADBackButton()
            : null);

    return SafeArea(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 56),
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            if (effectiveLeading != null)
              effectiveLeading
            else
              const SizedBox(width: 24),
            if (title != null) ...[
              DefaultTextStyle(
                style: ADTextStyle.h4,
                child: title!,
              ),
            ],
            const Spacer(),
            if (action != null) ...[
              action!,
              const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48 + 8);
}
