import 'dart:ui';

import 'package:adhd_project/common/hooks/use_disposable.dart';
import 'package:adhd_project/common/util/date_utils.dart';
import 'package:adhd_project/common/util/duration_formatter.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/tasks/widgets/timeline/timeline_now_indicator_shape.dart';
import 'package:adhd_project/features/tasks/widgets/timeline/timeline_task_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timetable/timetable.dart' hide DateTimeTimetable;

class TimelineTaskEvent extends BasicEvent {
  TimelineTaskEvent({
    required this.task,
    required super.backgroundColor,
  }) : super(
          id: task.id!.toString(),
          title: task.description!,
          start: task.startDay!,
          end: task.deadlineDay!,
        );

  final TaskDto task;
}

class TasksTimeline extends HookWidget {
  const TasksTimeline({
    super.key,
    required this.date,
    this.tasks = const [],
  });

  final DateTime date;
  final Iterable<TaskDto> tasks;

  static const _taskEventColors = [
    Color(0xFFF94144),
    Color(0xFFF3722C),
    Color(0xFFF8961E),
    Color(0xFFF9844A),
    Color(0xFFF9C74F),
    Color(0xFF90BE6D),
    Color(0xFF43AA8B),
    Color(0xFF4D908E),
    Color(0xFF577590),
    Color(0xFF277DA1),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final dateController = useDisposable(
      () => DateController(
        // Visible range fixed to currently selected date in order to disable
        // horizontal scroll to switch dates
        visibleRange: VisibleDateRange.fixed(date.date, 1),
      ),
      (dateController) => dateController.dispose,
    );

    final timeController = useDisposable(
      () => TimeController(
        initialRange: TimeRange(Duration.zero, const Duration(hours: 4)),
        maxRange: TimeRange(Duration.zero, const Duration(hours: 24)),
        minDuration: const Duration(hours: 2),
      ),
      (timeController) => timeController.dispose,
      [],
    );

    useEffect(() => dateController.dispose, [dateController]);
    useEffect(() => timeController.dispose, [timeController]);

    // Yet another bug in that package - event can't spread over more than 2 calendar day
    // 2. And another one - package doesn't normalize the UTC time to local time when displaying
    final validTasks = tasks.map((e) {
      var start = e.startDay!.toUtc().add(e.startDay!.timeZoneOffset);
      start = start.sameDateAs(date)
          ? start.toUtc()
          : DateTime.utc(date.year, date.month, date.day);

      var end = e.deadlineDay!.toUtc().add(e.deadlineDay!.timeZoneOffset);
      end = end.sameDateAs(date)
          ? end.toUtc()
          : DateTime.utc(date.year, date.month, date.day, 23, 59, 59);

      return e.copyWith(startDay: start, deadlineDay: end);
    });

    // So, there is a bug in the timetable package, hard to locate it but
    // it seems that if we specify in `TimetableConfig` any other type than `BasicEvent`
    // then it gets null exceptions somewhere. Thats why we put only `TimelineTaskEvent`
    // as task, and then map it in `eventBuilder`
    return TimetableConfig<BasicEvent>(
      dateController: dateController,
      timeController: timeController,
      eventBuilder: (context, event) => TimelineTaskWidget(
        task: (event as TimelineTaskEvent).task,
        backgroundColor: event.backgroundColor,
      ),
      eventProvider: eventProviderFromFixedList(
        validTasks
            .mapIndexed(
              (i, task) => TimelineTaskEvent(
                task: task,
                backgroundColor: _taskEventColors[i % _taskEventColors.length],
              ),
            )
            .toList(),
      ),

      // TODO: Fix that - useful for whole day tasks
      allDayEventBuilder: (context, event, info) => BasicAllDayEventWidget(
        event,
        info: info,
      ),
      theme: TimetableThemeData(
        context,
        startOfWeek: DateTime.monday,
        dateDividersStyle: DateDividersStyle(
          context,
          color: Colors.transparent,
          width: 16,
        ),
        nowIndicatorStyle: NowIndicatorStyle(
          context,
          lineColor: ADGradients.red.colors.first,
          lineWidth: 4,
          shape: TimelineNowIndicatorShape(backgroundColor: colors.background),
        ),
        timeIndicatorStyleProvider: (time) => TimeIndicatorStyle(
          context,
          time,
          alwaysUse24HourFormat: true,
          label: DurationFormatter.formatHhMm(time),
          textStyle:
              ADTextStyle.bodyLarge.withWeight(ADFontWeight.medium).copyWith(
            color: colors.textTetriary,
            fontFeatures: [const FontFeature.tabularFigures()],
          ),
        ),
        dateEventsStyleProvider: (date) => DateEventsStyle(
          context, date,
          stackedEventSpacing: 12,
          enableStacking: true,
          // Vertical padding would not work here
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
      child: MultiDateTimetable<BasicEvent>(
        headerBuilder: (header, leadingWidth) =>
            MultiDateTimetableHeader<BasicEvent>(
          // To remove default widget
          leading: const SizedBox(),
          dateHeaderBuilder: (context, date) => const SizedBox(),
          bottom: const SizedBox(),
        ),
        contentLeading: const _TimelineContentLeading(),
      ),
    );
  }
}

// Copy-paste from source code to align text to left
class _TimelineContentLeading extends StatelessWidget {
  const _TimelineContentLeading();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: TimeZoom(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 16, 12),
          child: Builder(
            builder: (context) => TimeIndicators.hours(
              firstHour: 0,
              lastHour: 24,
              alignment: Alignment.centerLeft,
              styleProvider:
                  TimetableTheme.of(context)?.timeIndicatorStyleProvider,
            ),
          ),
        ),
      ),
    );
  }
}
