import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef ADDropdownItemBuilder<T> = String Function(T value);

class ADDropdown<T> extends HookWidget {
  const ADDropdown({
    super.key,
    this.itemsKeyPrefix,
    required this.items,
    required this.itemsBuilder,
    this.value,
    this.labelText,
    this.onChanged,
    this.featuredItems = const [],
    this.centerLabel = false,
    this.validator,
  });

  final String? itemsKeyPrefix;

  final List<T> items;
  final List<T> featuredItems;
  final T? value;
  final String? labelText;
  final ValueChanged<T?>? onChanged;
  final ADDropdownItemBuilder<T> itemsBuilder;
  final bool centerLabel;
  final FormFieldValidator<T?>? validator;

  List<DropdownMenuItem<T>> get _items {
    final featuredLength = featuredItems.length - 1;

    ADText buildText(T data, {int? index}) {
      final itemKeyString = '$itemsKeyPrefix${index ?? ' '}';

      return ADText(
        key: Key(itemKeyString),
        itemsBuilder(data),
        overflow: TextOverflow.ellipsis,
      );
    }

    return [
      if (featuredItems.isNotEmpty)
        ...featuredItems.mapIndexed(
          (i, value) {
            final text = buildText(value, index: i);

            return DropdownMenuItem<T>(
              value: value,
              child: i == featuredLength
                  ? _DividedText(
                      text,
                    )
                  : text,
            );
          },
        ),
      ...items.map<DropdownMenuItem<T>>(
        (value) => DropdownMenuItem<T>(
          value: value,
          child: buildText(value, index: items.indexOf(value)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final dropdownItems = useMemoized(
      () => _items,
      [items, featuredItems],
    );

    const borderRadius = BorderRadius.all(Radius.circular(16));

    return FormField<T?>(
      validator: validator,
      initialValue: value,
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Align(
              alignment: centerLabel ? Alignment.center : Alignment.centerLeft,
              child: ADText(
                labelText!,
                style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.semiBold),
                textAlign: centerLabel ? TextAlign.center : TextAlign.start,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Container(
            height: ADDesignConsts.inputFieldHeight,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.inputFieldBackground,
              borderRadius: borderRadius,
              border: Border.all(
                color: state.hasError ? colors.error : ADColors.grey200,
              ),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              padding: EdgeInsets.zero,
              child: DropdownButton<T>(
                items: dropdownItems,
                value: value,
                style: ADTextStyle.bodyMedium.withWeight(ADFontWeight.semiBold),
                onChanged: value != null && dropdownItems.length == 1
                    ? null
                    : (v) {
                        // ignore: invalid_use_of_protected_member
                        state.setValue(v);
                        onChanged?.call(v);
                      },
                borderRadius: borderRadius,
                dropdownColor: colors.background,
                isExpanded: true,
                icon: const _Icon(),
                underline: const SizedBox(),
                elevation: 1,
                menuMaxHeight: 400,
                alignment: AlignmentDirectional.topCenter,
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

class _DividedText extends StatelessWidget {
  const _DividedText(this.text);

  final ADText text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: text,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Divider(
            height: 0,
            color: ADColors.of(context).neutralDark,
          ),
        ),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Icon(
        Icons.keyboard_arrow_down,
        color: ADColors.of(context).textTetriary,
      ),
    );
  }
}
