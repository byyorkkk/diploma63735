import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class ADSlider extends StatelessWidget {
  const ADSlider({
    super.key,
    required this.label,
    this.min = 0,
    required this.max,
    this.onChange,
    this.value,
  })  : assert(max >= min),
        assert(value == null || (value >= min && value <= max));

  final String label;
  final int min;
  final int max;
  final ValueChanged<int>? onChange;

  /// If null defaults to [min]
  final int? value;

  @override
  Widget build(BuildContext context) {
    final value = this.value;

    final colors = ADColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADText(
          label,
          style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.semiBold),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 40,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FlutterSlider(
                jump: true,
                values: [
                  // If initValue is not null then make it first element of values list
                  // (a way of telling slider that we want it as initial value)
                  if (value != null) value.toDouble(),
                  for (var i = min; i < max; i++)
                    if (i != value) i.toDouble(),
                ],
                min: min.toDouble(),
                max: max.toDouble(),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  final value = (lowerValue as double?)?.toInt();
                  if (value != null) {
                    onChange?.call(value);
                  }
                },
                handlerWidth: 20,
                handlerHeight: 20,
                handler: FlutterSliderHandler(
                  child: Stack(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: ADGradients.red,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                trackBar: FlutterSliderTrackBar(
                  activeTrackBarHeight: 6,
                  inactiveTrackBarHeight: 6,
                  activeTrackBar: BoxDecoration(
                    gradient: ADGradients.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  inactiveTrackBar: BoxDecoration(
                    color: colors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                tooltip: FlutterSliderTooltip(
                  alwaysShowTooltip: true,
                  custom: (value) {
                    return Transform.translate(
                      offset: const Offset(0, -24),
                      child: CustomPaint(
                        painter: ADSliderTooltipCustomPainter(),
                        child: Container(
                          width: 40,
                          height: 32,
                          padding: const EdgeInsets.only(bottom: 2),
                          alignment: Alignment.center,
                          child: ADText(
                            (value as double).toStringAsFixed(0),
                            style: ADTextStyle.bodySmall
                                .withWeight(ADFontWeight.bold),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: -8,
                left: 8,
                child: ADText(
                  min.toString(),
                  style: ADTextStyle.bodyMedium.withWeight(ADFontWeight.medium),
                  color: colors.textSecondary,
                  textAlign: TextAlign.start,
                ),
              ),
              Positioned(
                bottom: -8,
                right: 8,
                child: ADText(
                  max.toString(),
                  style: ADTextStyle.bodyMedium.withWeight(ADFontWeight.medium),
                  color: colors.textSecondary,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
