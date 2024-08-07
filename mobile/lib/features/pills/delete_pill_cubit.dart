import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/pills/pill_form/pill_form_cubit.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;

class DeletePillCubit extends DeleteItemCubit<PillDto>
    with comms.Sender<PillsChangedMessage> {
  DeletePillCubit(super.api);

  @override
  Future<Response<dynamic>> apiDeleteCallback(
    AdApi api,
    PillDto item,
  ) {
    return api.apiPillsIdDelete(id: item.pillID);
  }

  @override
  void onSuccess() {
    send(PillsChangedMessage());
  }
}
