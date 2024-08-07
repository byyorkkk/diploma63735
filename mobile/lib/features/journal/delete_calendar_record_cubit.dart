import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/journal/calendar_record_form/calendar_record_form_cubit.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;

class DeleteCalendarRecordCubit extends DeleteItemCubit<CalendarRecordDto>
    with comms.Sender<CalendarRecordsChangedMessage> {
  DeleteCalendarRecordCubit(super.api);

  @override
  Future<Response<dynamic>> apiDeleteCallback(
    AdApi api,
    CalendarRecordDto item,
  ) {
    return api.apiCalendarRecordDeleteIdDelete(id: item.id);
  }

  @override
  void onSuccess() {
    send(CalendarRecordsChangedMessage());
  }
}
