import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADEditDeleteOptionsButton extends StatelessWidget {
  const ADEditDeleteOptionsButton({
    super.key,
    required this.itemType,
    this.onEditPressed,
    this.onDeletePressed,
  });

  final ADConfirmDeleteItemType itemType;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ADMoreButton(
      options: [
        MoreOption(
          name: 'Edit',
          icon: ADIcon(
            icon: Assets.icons.x24.edit,
            size: 20,
          ),
          onPressed: onEditPressed,
        ),
        MoreOption(
          name: 'Delete',
          icon: ADIcon(
            icon: Assets.icons.x24.delete,
            size: 20,
          ),
          onPressed: () async {
            final result = await ADConfirmDeleteDialog(
              itemType: itemType,
            ).show(context);

            if (result ?? false) {
              onDeletePressed?.call();
            }
          },
        ),
      ],
    );
  }
}
