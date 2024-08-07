import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/journal/model/journal_mood.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;

class CalendarRecordFormCubit extends Cubit<CalendarRecordFormState>
    with
        BlocPresentationMixin<CalendarRecordFormState,
            CalendarRecordFormSaveEvent>,
        comms.Sender<CalendarRecordsChangedMessage> {
  CalendarRecordFormCubit(this._api) : super(CalendarRecordFormState.idle);

  final AdApi _api;

  Future<void> createCalendarRecord({
    required String description,
    required DateTime date,
    required JournalMood mood,
    required Iterable<PillDto> pills,
  }) async {
    emit(CalendarRecordFormState.saving);

    final res = await _api.apiCalendarRecordCreateRecordPost(
      body: CalendarRecordDto(
        noteDescription: description,
        date: date,
        moodStatus: mood.backendEnumValue,
        pillIds: pills.map((e) => e.pillID!).toList(),
      ),
    );

    if (res.isSuccessful) {
      send(CalendarRecordsChangedMessage());
      emitPresentation(CalendarRecordFormSaveSuccessEvent());
    } else {
      emitPresentation(CalendarRecordFormSaveErrorEvent());
    }

    emit(CalendarRecordFormState.idle);
  }

  Future<void> editCalendarRecord({
    required CalendarRecordDto calendarRecord,
    required String description,
    required DateTime date,
    required JournalMood mood,
    required Iterable<PillDto> pills,
  }) async {
    emit(CalendarRecordFormState.saving);

    final res = await _api.apiCalendarRecordEditRecordIdPut(
      id: calendarRecord.id,
      body: CalendarRecordDto(
        id: calendarRecord.id,
        noteDescription: description,
        date: date,
        moodStatus: mood.backendEnumValue,
        pillIds: pills.map((e) => e.pillID!).toList(),
      ),
    );

    if (res.isSuccessful) {
      send(CalendarRecordsChangedMessage());
      emitPresentation(CalendarRecordFormSaveSuccessEvent());
    } else {
      emitPresentation(CalendarRecordFormSaveErrorEvent());
    }

    emit(CalendarRecordFormState.idle);
  }
}

enum CalendarRecordFormState { idle, saving }

class CalendarRecordsChangedMessage {}

sealed class CalendarRecordFormSaveEvent {}

class CalendarRecordFormSaveSuccessEvent extends CalendarRecordFormSaveEvent {}

class CalendarRecordFormSaveErrorEvent extends CalendarRecordFormSaveEvent {}
