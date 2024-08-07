import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';

class ADMoreButton extends HookWidget {
  const ADMoreButton({
    super.key,
    this.enabled = true,
    required this.options,
  });

  final bool enabled;
  final List<MoreOption> options;

  @override
  Widget build(BuildContext context) {
    final visible = useState(false);

    return PortalTarget(
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => visible.value ? visible.value = false : null,
      ),
      visible: visible.value,
      child: PortalTarget(
        visible: visible.value,
        portalFollower: Container(
          decoration: BoxDecoration(
            color: ADColors.of(context).background,
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(2, 2),
                spreadRadius: -1,
                color: Color(0x33000000),
              ),
              BoxShadow(
                blurRadius: 4,
                color: Color(0x55000000),
                spreadRadius: -2,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final option in options)
                  InkWell(
                    onTap: () {
                      visible.value = false;
                      option.onPressed?.call();
                    },
                    child: SizedBox(
                      height: 42,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            if (option.icon case final icon?) ...[
                              icon,
                              const SizedBox(width: 16),
                            ],
                            Text(
                              option.name,
                              style: ADTextStyle.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        anchor: const Aligned(
          follower: Alignment.bottomRight,
          target: Alignment.topRight,
          offset: Offset(-12, 12),
          backup: Aligned(
            follower: Alignment.topRight,
            target: Alignment.bottomRight,
            offset: Offset(-12, -12),
          ),
        ),
        child: ADIconButton(
          icon: ADIcon(icon: Assets.icons.x24.more),
          onPressed: enabled ? () => visible.value = !visible.value : null,
          splashRadius: 16,
        ),
      ),
    );
  }
}

class MoreOption {
  const MoreOption({
    this.icon,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final Widget? icon;
  final VoidCallback? onPressed;
}
