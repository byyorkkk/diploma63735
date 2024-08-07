import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/tasks/task_form/task_form_cubit.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;

class DeleteTaskCubit extends DeleteItemCubit<TaskDto>
    with comms.Sender<TasksChangedMessage> {
  DeleteTaskCubit(super.api);

  @override
  Future<Response<dynamic>> apiDeleteCallback(
    AdApi api,
    TaskDto item,
  ) {
    return api.apiTasksIdDelete(id: item.id);
  }

  @override
  void onSuccess() {
    send(TasksChangedMessage());
  }
}
