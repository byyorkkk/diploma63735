import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/util/validators.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/journal/calendar_record_form/calendar_record_form_cubit.dart';
import 'package:adhd_project/features/journal/model/journal_mood.dart';
import 'package:adhd_project/features/journal/widgets/journal_mood_face_circle.dart';
import 'package:adhd_project/features/pills/pills_cubit.dart';
import 'package:adhd_project/features/pills/widgets/pill_styled_text.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

enum _CalendarRecordFormScreenType { create, edit }

class CalendarRecordFormScreen extends HookWidget {
  const CalendarRecordFormScreen.create({
    super.key,
    required DateTime this.initialDateTime,
  })  : type = _CalendarRecordFormScreenType.create,
        calendarRecord = null;

  const CalendarRecordFormScreen.edit({
    super.key,
    required CalendarRecordDto this.calendarRecord,
  })  : type = _CalendarRecordFormScreenType.edit,
        initialDateTime = null;

  final _CalendarRecordFormScreenType type;
  final CalendarRecordDto? calendarRecord;
  final DateTime? initialDateTime;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc(
      () => CalendarRecordFormCubit(context.read()),
    );
    final state = useBlocState(cubit);

    final pillsCubit = context.watch<PillsCubit>();
    final pillsState = pillsCubit.state;

    useOnStreamChange(
      cubit.presentation,
      onData: (event) async {
        final typeText =
            type == _CalendarRecordFormScreenType.create ? 'saved' : 'edited';
        switch (event) {
          case CalendarRecordFormSaveSuccessEvent():
            await showSuccessSnackbar(
              context: context,
              text: 'Successfully $typeText the calendarRecord',
              async: true,
            );
            GoRouter.of(context).pop();
            return;

          case CalendarRecordFormSaveErrorEvent():
            showSuccessSnackbar(
              context: context,
              text:
                  'Failed to $typeText the calendarRecord. Please try again later.',
            );
        }
      },
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);

    // TODO: Attach edit values to the hooks after DTO changed
    final descriptionController =
        useTextEditingController(text: calendarRecord?.noteDescription);
    final selectedMood = useState(
      calendarRecord == null
          ? null
          : JournalMood.fromValue(calendarRecord!.moodStatus ?? 0),
    );
    final date = useState(
      calendarRecord?.date ?? initialDateTime ?? DateTime.now(),
    );
    final time = useState(
      TimeOfDay.fromDateTime(
        calendarRecord?.date ?? initialDateTime ?? DateTime.now(),
      ),
    );

    return ADScaffold(
      wrapInSafeArea: false,
      safeAreaBottom: false,
      actionInProgress: state == CalendarRecordFormState.saving,
      appBar: ADAppBar(
        title: ADText(
          '${type == _CalendarRecordFormScreenType.create ? 'Create' : 'Edit'} journal',
        ),
        action: ADTetriaryButton(
          leadingIcon: ADIcon(
            icon: Assets.icons.x24.pill,
          ),
          label: 'Pills',
          onPressed: () {
            GoRouter.of(context).push(PillsRoute<void>().location);
          },
        ),
      ),
      body: pillsState.map(
        loading: (_) => const Center(child: CircularProgressIndicator()),
        error: (_) => ADCommonErrorRefetchWidget(
          onRefetch: context.read<PillsCubit>().fetch,
        ),
        ready: (pillsState) => HookBuilder(
          builder: (context) {
            final selectedPill = useState<PillDto?>(null);
            final pills = useState(
              calendarRecord?.pillIds
                      ?.map(
                        (pillId) => pillsState.pills
                            .firstWhereOrNull((pill) => pill.pillID == pillId),
                      )
                      .whereNotNull()
                      .toList() ??
                  [],
            );
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    ADTextField(
                      labelText: 'Note',
                      maxLines: null,
                      controller: descriptionController,
                      validator: requiredFieldValidator,
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: JournalMood.values
                            .mapIndexed(
                              (i, e) => [
                                if (i != 0) const SizedBox(width: 12),
                                _MoodItem(
                                  mood: e,
                                  selectedMood: selectedMood,
                                ),
                              ],
                            )
                            .expand((e) => e)
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ADDateField(
                            labelText: 'Date',
                            value: date.value,
                            onValueChanged: (v) => date.value = v,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: ADTimeField(
                            labelText: 'Time',
                            value: time.value,
                            onValueChanged: (v) => time.value = v,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _PillsSection(
                      pillsState: pillsState,
                      includedPills: pills,
                      selectedPill: selectedPill,
                    ),
                    const SizedBox(height: 80),
                    ADPrimaryButton(
                      label: 'Save',
                      onPressed: selectedMood.value == null
                          ? null
                          : () {
                              final finalDate = DateTime(
                                date.value.year,
                                date.value.month,
                                date.value.day,
                                time.value.hour,
                                time.value.minute,
                              );
                              switch (type) {
                                case _CalendarRecordFormScreenType.create:
                                  cubit.createCalendarRecord(
                                    description: descriptionController.text,
                                    date: finalDate,
                                    mood: selectedMood.value!,
                                    pills: pills.value,
                                  );
                                  return;
                                case _CalendarRecordFormScreenType.edit:
                                  cubit.editCalendarRecord(
                                    calendarRecord: calendarRecord!,
                                    description: descriptionController.text,
                                    date: finalDate,
                                    mood: selectedMood.value!,
                                    pills: pills.value,
                                  );
                                  return;
                              }
                            },
                    ),
                    const BottomPageSpacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MoodItem extends StatelessWidget {
  const _MoodItem({
    required this.selectedMood,
    required this.mood,
  });

  final ValueNotifier<JournalMood?> selectedMood;
  final JournalMood mood;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final isSelected = mood == selectedMood.value;

    return Expanded(
      flex: isSelected ? 3 : 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => selectedMood.value = mood,
            child: Material(
              borderRadius: BorderRadius.circular(100),
              color: colors.backgroundSecondary,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints.tightFor(width: isSelected ? 160 : 120),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: JournalMoodFaceCircle(mood: mood),
                ),
              ),
            ),
          ),
          if (isSelected) ...[
            const SizedBox(height: 8),
            ADAutoSizeText(
              mood.tr(),
              style: ADTextStyle.h5,
              maxLines: 1,
            ),
          ],
        ],
      ),
    );
  }
}

class _PillsSection extends StatelessWidget {
  const _PillsSection({
    required this.pillsState,
    required this.selectedPill,
    required this.includedPills,
  });

  final PillsReady pillsState;
  final ValueNotifier<PillDto?> selectedPill;
  final ValueNotifier<Iterable<PillDto>> includedPills;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ADDropdown<PillDto>(
                items: pillsState.pills,
                itemsBuilder: (e) => '${e.pillName} (${e.pillDose})',
                value: selectedPill.value,
                onChanged: (value) => selectedPill.value = value,
                labelText: 'Pill',
              ),
            ),
            const SizedBox(width: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ADIconButton.svg(
                icon: Assets.icons.x24.add,
                onPressed: selectedPill.value == null
                    ? null
                    : () {
                        includedPills.value = includedPills.value.toList()
                          ..add(selectedPill.value!);
                        selectedPill.value = null;
                      },
              ),
            ),
          ],
        ),
        if (includedPills.value.isNotEmpty) ...[
          const SizedBox(height: 16),
          for (final pill in includedPills.value) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: PillStyledText(pill: pill)),
                const SizedBox(width: 16),
                ADIconButton.svg(
                  icon: Assets.icons.x24.close,
                  onPressed: () => includedPills.value =
                      includedPills.value.toList()..remove(pill),
                ),
              ],
            ),
          ],
        ],
      ],
    );
  }
}
