import 'package:adhd_project/common/hooks/use_on_delete_item_listener.dart';
import 'package:adhd_project/common/util/date_utils.dart';
import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/journal/delete_calendar_record_cubit.dart';
import 'package:adhd_project/features/journal/journal_cubit.dart';
import 'package:adhd_project/features/journal/model/journal_mood.dart';
import 'package:adhd_project/features/journal/widgets/journal_mood_face_circle.dart';
import 'package:adhd_project/features/pills/pills_cubit.dart';
import 'package:adhd_project/features/pills/widgets/pill_styled_text.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class JournalScreen extends HookWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<JournalCubit>();
    final state = cubit.state;

    final deleteCubit = useBloc(
      () => DeleteCalendarRecordCubit(context.read()),
    );

    useOnDeleteItemListener(deleteCubit, (event) {
      switch (event) {
        case DeleteItemSuccessEvent():
          showSuccessSnackbar(
            context: context,
            text: 'Successfully removed the journal entry',
          );
        case DeleteItemErrorEvent():
          showErrorSnackbar(
            context: context,
            text: 'Failed to remove the journal entry',
          );
      }
    });

    return Provider.value(
      value: deleteCubit,
      child: state.map(
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        ready: (state) {
          final day = state.focusedDay;
          final selectedDayRecords = state.sortedRecords
              .where((e) => e.date!.sameDateAs(day))
              .toList();
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: JournalCalendar(
                    state: state,
                  ),
                ),
                if (selectedDayRecords.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const ADText(
                    'Events',
                    style: ADTextStyle.h4,
                  ),
                  for (final event in selectedDayRecords) ...[
                    const SizedBox(height: 24),
                    JournalDayEvent(
                      event: event,
                    ),
                  ],
                ],
                const BottomPageSpacer(),
              ],
            ),
          );
        },
        error: (_) => ADCommonErrorRefetchWidget(onRefetch: cubit.fetch),
      ),
    );
  }
}

class JournalCalendar extends HookWidget {
  const JournalCalendar({
    super.key,
    required this.state,
  });

  final JournalReady state;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final now = DateTime.now();
    const width = 400.0;
    const rowHeight = width / 7;

    const calendarBorderRadius = 16.0;

    return Container(
      width: width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(calendarBorderRadius),
        color: colors.backgroundSecondary,
      ),
      child: TableCalendar(
        calendarBuilders: CalendarBuilders<CalendarRecordDto>(
          selectedBuilder: (context, day, focusedDay) => Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: colors.primary,
            ),
            width: rowHeight,
            height: rowHeight,
            child: Center(
              child: ADText(
                day.day.toString(),
              ),
            ),
          ),
          todayBuilder: (context, day, focusedDay) => Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ADColors.primaryRedLight,
            ),
            width: rowHeight,
            height: rowHeight,
            child: Center(
              child: ADText(
                day.day.toString(),
              ),
            ),
          ),
        ),
        firstDay: now.subtract(const Duration(days: 365)),
        lastDay: now.add(const Duration(days: 365)),
        currentDay: now,
        focusedDay: now,
        selectedDayPredicate: (day) => day.sameDateAs(state.focusedDay),
        rowHeight: rowHeight,
        eventLoader: (date) =>
            state.sortedRecords.where((e) => e.date!.sameDateAs(date)).toList(),
        onDaySelected: (selected, focused) {
          context.read<JournalCubit>().onFocusedDayChanged(selected);
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: ADTextStyle.h6.copyWith(color: Colors.white),
          headerMargin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: const BorderRadiusDirectional.vertical(
              top: Radius.circular(calendarBorderRadius),
            ),
          ),
          leftChevronIcon: ADIcon(
            icon: Assets.icons.x24.chevronLeft,
            color: Colors.white,
            size: 24,
          ),
          rightChevronIcon: ADIcon(
            icon: Assets.icons.x24.chevronRight,
            color: Colors.white,
            size: 24,
          ),
        ),
        calendarStyle: CalendarStyle(
          markerSize: 8,
          markerMargin: const EdgeInsets.symmetric(horizontal: 1),
          markersMaxCount: 3,
          markersAutoAligned: false,
          markersOffset: const PositionedOffset(bottom: 10),
          markerDecoration: BoxDecoration(
            color: colors.secondary,
          ),
        ),
      ),
    );
  }
}

class JournalDayEvent extends StatelessWidget {
  const JournalDayEvent({
    super.key,
    required this.event,
  });

  final CalendarRecordDto event;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final locale = Localizations.localeOf(context);

    final pillsCubit = context.watch<PillsCubit>();
    final pillsState = pillsCubit.state;

    final mood = JournalMood.fromValue(event.moodStatus!);

    const width = 400.0;
    const shadow = BoxShadow(
      offset: Offset(3, 3),
      color: Color(0x77000000),
      spreadRadius: -3,
      blurRadius: 6,
    );

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colors.backgroundSecondary,
        boxShadow: const [shadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  boxShadow: const [shadow],
                ),
                child: ADText(
                  DateFormat.Hm(locale.languageCode).format(event.date!),
                  color: Colors.white,
                  style: ADTextStyle.bodyMedium.withWeight(
                    ADFontWeight.semiBold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 40,
                height: 40,
                child: JournalMoodFaceCircle(
                  mood: mood,
                ),
              ),
              ADText(
                mood.tr(),
                style: ADTextStyle.bodyMedium,
              ),
              const Spacer(),
              ADEditDeleteOptionsButton(
                itemType: ADConfirmDeleteItemType.calendarRecord,
                onEditPressed: () => GoRouter.of(context).push(
                  EditCalendarRecordRoute<void>(
                    calendarRecordId: event.id!,
                  ).location,
                ),
                onDeletePressed: () =>
                    context.read<DeleteCalendarRecordCubit>().delete(event),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...pillsState.map(
                  loading: (_) =>
                      [const Center(child: CircularProgressIndicator())],
                  ready: (state) => [
                    if (event.noteDescription case final description?) ...[
                      const SizedBox(height: 4),
                      ADText(
                        description,
                        style: ADTextStyle.bodyMedium.withWeight(
                          ADFontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    for (final pill in event.getEventPills(state.pills)) ...[
                      const SizedBox(height: 6),
                      PillStyledText(pill: pill),
                    ],
                    const SizedBox(height: 12),
                    const Column(),
                    const SizedBox(height: 24),
                  ],
                  error: (_) => [
                    ADCommonErrorRefetchWidget(onRefetch: pillsCubit.fetch),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
