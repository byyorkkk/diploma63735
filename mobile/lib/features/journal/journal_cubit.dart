import 'package:adhd_project/common/util/decode_api_query.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/journal/calendar_record_form/calendar_record_form_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'journal_cubit.freezed.dart';

class JournalCubit extends Cubit<JournalState>
    with comms.Listener<CalendarRecordsChangedMessage> {
  JournalCubit(this._api) : super(const JournalState.loading()) {
    listen();
  }

  final AdApi _api;

  final _logger = Logger('JournalCubit');

  Future<void> fetch() async {
    final focusedDay = state.mapOrNull(ready: (state) => state.focusedDay);

    emit(const JournalState.loading());

    final res = await _api.apiCalendarRecordGetRecordsGet();

    if (res.isSuccessful) {
      final records =
          decodeApiQuery(res.bodyString).map(CalendarRecordDto.fromJson);

      final sortedRecords =
          records.sorted((a, b) => a.date!.compareTo(b.date!)).toList();

      emit(
        JournalState.ready(
          sortedRecords: sortedRecords,
          focusedDay: focusedDay ?? DateTime.now(),
        ),
      );
      return;
    }

    _logger.shout(
      'Failed to load calendar records',
      res.error,
    );

    emit(const JournalState.error());
  }

  @override
  void onMessage(CalendarRecordsChangedMessage message) {
    fetch();
  }

  void onFocusedDayChanged(DateTime newFocus) {
    final state = this.state;
    if (state is! JournalReady) {
      return;
    }

    emit(state.copyWith(focusedDay: newFocus));
  }
}

@freezed
class JournalState with _$JournalState {
  const factory JournalState.loading() = JournalLoading;
  const factory JournalState.ready({
    required List<CalendarRecordDto> sortedRecords,
    required DateTime focusedDay,
  }) = JournalReady;
  const factory JournalState.error() = JournalError;
}

extension XCalendarRecordDto on CalendarRecordDto {
  List<PillDto> getEventPills(Iterable<PillDto> allPills) {
    return pillIds
            ?.map((id) => allPills.firstWhere((e) => e.pillID == id))
            .toList() ??
        [];
  }
}
