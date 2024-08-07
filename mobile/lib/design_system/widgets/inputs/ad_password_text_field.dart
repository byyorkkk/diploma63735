import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ADPasswordTextField extends HookWidget {
  const ADPasswordTextField({
    required this.controller,
    this.label,
    this.focusNode,
    this.nextFocusNode,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final obscureText = useState(true);
    final iconColor =
        (focusNode?.hasFocus ?? false) ? colors.primary : colors.icon;

    return ADTextField(
      obscureText: obscureText.value,
      autocorrect: false,
      focusNode: focusNode,
      controller: controller,
      nextFocusNode: nextFocusNode,
      validator: validator,
      labelText: label ?? 'Password',
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      prefixIcon: Center(
        child: ADIcon(
          icon: Assets.icons.x24.lock,
          color: iconColor,
          size: 20,
        ),
      ),
      suffixIcon: ADIconButton(
        splashRadius: 24,
        onPressed: () => obscureText.value = !obscureText.value,
        icon: ADIcon(
          icon: obscureText.value
              ? Assets.icons.x24.visibilityOff
              : Assets.icons.x24.visibilityOn,
          color: iconColor,
        ),
      ),
    );
  }
}
