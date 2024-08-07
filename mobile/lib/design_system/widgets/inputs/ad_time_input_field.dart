import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// TODO: Refactor with ADDateField
class ADTimeField extends HookWidget {
  const ADTimeField({
    super.key,
    this.labelText,
    required this.onValueChanged,
    this.value,
    this.validator,
  });

  final String? labelText;
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay> onValueChanged;
  final FormFieldValidator<TimeOfDay?>? validator;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return FormField<TimeOfDay?>(
      validator: validator,
      initialValue: value,
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            ADText(
              labelText!,
              style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.semiBold),
            ),
            const SizedBox(height: 8),
          ],
          Material(
            color: colors.inputFieldBackground,
            borderRadius: borderRadius,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () async {
                final selectedTime = await AdaptiveTimePicker.show(
                  context,
                  initialTime: value,
                );
                if (selectedTime != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(selectedTime);
                  onValueChanged(selectedTime);
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: ADDesignConsts.inputFieldHeight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: state.hasError ? colors.error : ADColors.grey200,
                  ),
                ),
                child: Row(
                  children: [
                    if (value case final value?)
                      Expanded(
                        child: ADText(
                          value.format(context),
                          style: ADTextStyle.bodyMedium
                              .withWeight(ADFontWeight.semiBold),
                        ),
                      )
                    else
                      const Spacer(),
                    const SizedBox(width: 4),
                    ADIcon(icon: Assets.icons.x24.clock),
                  ],
                ),
              ),
            ),
          ),
          if (state.hasError) ...[
            const SizedBox(height: 4),
            ADTextFieldError(
              message: state.errorText!,
            ),
          ],
        ],
      ),
    );
  }
}

abstract class AdaptiveTimePicker {
  static Future<TimeOfDay?> show(
    BuildContext context, {
    TimeOfDay? initialTime,
  }) {
    final platform = Theme.of(context).platform;
    final effectiveInitialTime = initialTime ?? TimeOfDay.now();

    if (platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => _CupertinoTimePicker(
          initialTime: effectiveInitialTime,
        ),
      );
    } else {
      return showTimePicker(
        context: context,
        initialTime: effectiveInitialTime,
      );
    }
  }
}

class _CupertinoTimePicker extends HookWidget {
  const _CupertinoTimePicker({
    required this.initialTime,
  });

  final TimeOfDay initialTime;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final time = useState<TimeOfDay>(initialTime);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, time.value);
        return true;
      },
      child: Container(
        height: 300,
        color: colors.background,
        child: CupertinoTimerPicker(
          onTimerDurationChanged: (_) {},
          mode: CupertinoTimerPickerMode.hm,
        ),
      ),
    );
  }
}
