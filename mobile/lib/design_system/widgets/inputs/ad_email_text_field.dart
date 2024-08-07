import 'package:adhd_project/common/util/validators.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ADEmailTextField extends HookWidget {
  const ADEmailTextField({
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final iconColor =
        (focusNode?.hasFocus ?? false) ? colors.primary : colors.icon;

    return ADTextField(
      autocorrect: false,
      focusNode: focusNode,
      controller: controller,
      nextFocusNode: nextFocusNode,
      validator: emailValidator,
      labelText: 'Email',
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      prefixIcon: ADIcon(
        icon: Assets.icons.x24.email,
        color: iconColor,
        size: 20,
      ),
    );
  }
}
