import 'package:adhd_project/common/util/date_utils.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:timetable/timetable.dart';

class CalendarMonthDaysSlider extends HookWidget {
  const CalendarMonthDaysSlider({
    super.key,
    required this.selectedDay,
  });

  final DateTime selectedDay;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        initialPage: selectedDay.day,
        height: CalendarMonthStickySliderItem.height,
        viewportFraction: 1 / 7.5,
        enableInfiniteScroll: false,
      ),
      items: List<int>.generate(selectedDay.daysInMonth, (i) => i + 1)
          .map(
            (i) => CalendarMonthStickySliderItem(
              date: DateTime(selectedDay.year, selectedDay.month, i),
              selected: i == selectedDay.day,
            ),
          )
          .toList(),
    );
  }
}

class CalendarMonthStickySliderItem extends StatelessWidget {
  const CalendarMonthStickySliderItem({
    super.key,
    required this.date,
    required this.selected,
  });

  final DateTime date;
  final bool selected;

  static const widthWithPadding = width + 2 * paddingHorizontal;
  static const width = 48.0;
  static const paddingHorizontal = 6.0;
  static const height = 80.0;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final textColor = selected ? ADColors.white : colors.textSecondary;
    final borderRadius = BorderRadius.circular(100);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => context.read<TasksCubit>().pickDay(date),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: selected ? null : colors.backgroundSecondary,
            gradient: selected ? ADGradients.red : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ADText(
                ADDateUtils.weekdayIndicator(date),
                style: ADTextStyle.bodyMedium.withWeight(
                  selected ? ADFontWeight.bold : ADFontWeight.semiBold,
                ),
                color: textColor,
              ),
              const SizedBox(height: 6),
              ADText(
                '${date.day}',
                style: ADTextStyle.h5,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
