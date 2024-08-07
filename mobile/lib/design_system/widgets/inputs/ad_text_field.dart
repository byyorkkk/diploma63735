import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ADTextField extends HookWidget {
  const ADTextField({
    super.key,
    this.focusNode,
    this.nextFocusNode,
    this.controller,
    this.labelText,
    this.obscureText = false,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.autocorrect = true,
    this.enabled = true,
    this.onEditingComplete,
    this.maxLines = 1,
    this.autofillHints,
    this.validator,
  });

  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController? controller;
  final String? labelText;
  final bool obscureText;
  final String? prefixText;
  final String? suffixText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool enabled;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    // Borders
    const borderRadius = BorderRadius.all(Radius.circular(16));
    const border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: ADColors.grey200),
    );
    final errorBorder = border.copyWith(
      borderSide: BorderSide(color: colors.error),
    );
    final focusedBorder = border.copyWith(
      borderSide: BorderSide(color: colors.primary),
    );

    // Focus node
    final focusNode = useFocusNode();
    final effectiveFocusNode = this.focusNode ?? focusNode;
    useListenable(effectiveFocusNode);

    final effectiveOnEditingComplete =
        onEditingComplete ?? nextFocusNode?.requestFocus;

    final labelText = this.labelText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          ADText(
            labelText,
            style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.semiBold),
          ),
          const SizedBox(height: 8),
        ],
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: colors.background,
          ),
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            focusNode: effectiveFocusNode,
            style: ADTextStyle.bodyMedium.copyWith(
              color: colors.text,
            ),
            cursorHeight: 16,
            cursorColor: colors.text,
            decoration: InputDecoration(
              prefixText: prefixText != null ? '$prefixText ' : null,
              prefixIcon: prefixIcon != null
                  ? Material(
                      type: MaterialType.transparency,
                      child: Center(child: prefixIcon),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 48,
                maxWidth: 48,
              ),
              suffixText: suffixText,
              suffixIcon: suffixIcon != null
                  ? Material(
                      type: MaterialType.transparency,
                      child: Center(child: suffixIcon),
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 48,
                maxWidth: 48,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              focusedBorder: focusedBorder,
              enabledBorder: border,
              errorBorder: errorBorder,
              border: border,
              counterText: '',
              fillColor: colors.inputFieldBackground,
              filled: true,
            ),
            maxLines: maxLines,
            obscureText: obscureText,
            obscuringCharacter: '●',
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            autocorrect: autocorrect,
            onEditingComplete: effectiveOnEditingComplete,
            autofillHints: autofillHints,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
