import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timetable/timetable.dart';

class CalendarMonthNavigation extends HookWidget {
  const CalendarMonthNavigation({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final format = useMemoized(() => DateFormat('MMMM y'));

    return Row(
      children: [
        const SizedBox(width: 24),
        IconButton(
          icon: Assets.icons.x24.arrowCircleLeft.svg(),
          onPressed: () {
            final yearMonthDate = DateTime(
              date.month == 1 ? date.year - 1 : date.year,
              date.month == 1 ? 12 : date.month - 1,
            );
            context.read<TasksCubit>().pickDay(
                  yearMonthDate.copyWith(day: yearMonthDate.daysInMonth),
                );
          },
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ADText(
            format.format(date),
            style: ADTextStyle.h5,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: Assets.icons.x24.arrowCircleRight.svg(),
          onPressed: () {
            final yearMonthDate = DateTime(
              date.month == 12 ? date.year + 1 : date.year,
              date.month == 12 ? 1 : date.month + 1,
            );
            context.read<TasksCubit>().pickDay(
                  yearMonthDate.copyWith(day: 1),
                );
          },
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
