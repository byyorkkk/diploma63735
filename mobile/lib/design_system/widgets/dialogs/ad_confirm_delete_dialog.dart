import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

enum ADConfirmDeleteItemType {
  calendarRecord,
  pill,
  task;

  String tr() => switch (this) {
        calendarRecord => 'journal entry',
        pill => 'pill',
        task => 'task',
      };
}

class ADConfirmDeleteDialog extends StatelessWidget {
  const ADConfirmDeleteDialog({
    super.key,
    required this.itemType,
  });

  final ADConfirmDeleteItemType itemType;

  Future<bool?> show(BuildContext context) {
    return showDialog(context: context, builder: build);
  }

  @override
  Widget build(BuildContext context) {
    return ADDialog(
      title: 'Confirm delete',
      body: ADText(
        'Are you sure you want to delete the ${itemType.tr()}?',
      ),
      actions: [
        ADDialogAction.primary(
          text: 'Confirm',
          onPressed: () => Navigator.of(context).pop(true),
        ),
        ADDialogAction.secondary(
          text: 'Cancel',
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    );
  }
}
