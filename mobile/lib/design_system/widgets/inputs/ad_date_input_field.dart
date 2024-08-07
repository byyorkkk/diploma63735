import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

// TODO: Refactor with ADTimeField

class ADDateField extends HookWidget {
  const ADDateField({
    super.key,
    this.labelText,
    required this.onValueChanged,
    this.value,
    this.validator,
  });

  final String? labelText;
  final DateTime? value;
  final ValueChanged<DateTime> onValueChanged;
  final FormFieldValidator<DateTime?>? validator;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final dateFormat = useMemoized(() => DateFormat('dd/MM/yyyy'));
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return FormField<DateTime?>(
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
                final selectedDate = await AdaptiveDatePicker.show(
                  context,
                  initialDate: value,
                );
                if (selectedDate != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(selectedDate);
                  onValueChanged(selectedDate);
                }
              },
              child: Container(
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
                    if (value != null)
                      Expanded(
                        child: ADText(
                          dateFormat.format(value!),
                          style: ADTextStyle.bodyMedium
                              .withWeight(ADFontWeight.semiBold),
                        ),
                      )
                    else
                      const Spacer(),
                    const SizedBox(width: 4),
                    ADIcon(icon: Assets.icons.x24.calendar),
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

abstract class AdaptiveDatePicker {
  static final defaultMinDate = DateTime(1900);

  static Future<DateTime?> show(
    BuildContext context, {
    DateTime? initialDate,
  }) {
    final platform = Theme.of(context).platform;
    final effectiveInitialDate = initialDate ?? DateTime.now();

    final DateTime minDate;
    if (effectiveInitialDate.isBefore(defaultMinDate)) {
      minDate = effectiveInitialDate;
    } else {
      minDate = defaultMinDate;
    }

    var maxDate = DateTime.now().add(const Duration(days: 365));
    if (effectiveInitialDate.isAfter(maxDate)) {
      maxDate = effectiveInitialDate;
    }

    if (platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => _CupertinoDatePicker(
          initialDate: effectiveInitialDate,
          minDate: minDate,
          maxDate: maxDate,
        ),
      );
    } else {
      return showDatePicker(
        context: context,
        initialDate: effectiveInitialDate,
        firstDate: minDate,
        lastDate: maxDate,
      );
    }
  }
}

class _CupertinoDatePicker extends HookWidget {
  const _CupertinoDatePicker({
    this.minDate,
    this.maxDate,
    required this.initialDate,
  });

  final DateTime? minDate;
  final DateTime? maxDate;
  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final date = useState<DateTime>(initialDate);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, date.value);
        return true;
      },
      child: Container(
        height: 300,
        color: colors.background,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: date.value,
          minimumDate: minDate,
          maximumDate: maxDate,
          onDateTimeChanged: (selectedDate) => date.value = selectedDate,
        ),
      ),
    );
  }
}
