import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:chopper/chopper.dart';

abstract class DeleteItemCubit<T extends Object> extends Cubit<DeleteItemState>
    with BlocPresentationMixin<DeleteItemState, DeleteItemEvent<T>> {
  DeleteItemCubit(this._api) : super(DeleteItemState.idle);

  final AdApi _api;

  void onSuccess();
  Future<Response<dynamic>> apiDeleteCallback(AdApi api, T item);

  Future<void> delete(T item) async {
    emit(DeleteItemState.loading);

    final res = await apiDeleteCallback(_api, item);

    emit(DeleteItemState.idle);

    if (res.isSuccessful) {
      emitPresentation(DeleteItemSuccessEvent<T>());
      onSuccess();
      return;
    }

    emitPresentation(DeleteItemErrorEvent<T>());
  }
}

enum DeleteItemState { idle, loading }

class DeleteItemEvent<T extends Object> {}

class DeleteItemSuccessEvent<T extends Object> extends DeleteItemEvent<T> {}

class DeleteItemErrorEvent<T extends Object> extends DeleteItemEvent<T> {}
