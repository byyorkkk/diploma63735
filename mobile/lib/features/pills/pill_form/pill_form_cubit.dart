import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;

class PillFormCubit extends Cubit<PillFormState>
    with
        BlocPresentationMixin<PillFormState, PillFormSaveEvent>,
        comms.Sender<PillsChangedMessage> {
  PillFormCubit(this._api) : super(PillFormState.idle);

  final AdApi _api;

  Future<void> createPill({
    required String name,
    required String dose,
  }) async {
    emit(PillFormState.saving);

    final res = await _api.apiPillsNewPost(
      body: PillDto(pillName: name, pillDose: dose),
    );

    if (res.isSuccessful) {
      send(PillsChangedMessage());
      emitPresentation(PillFormSaveSuccessEvent());
    } else {
      emitPresentation(PillFormSaveErrorEvent());
    }

    emit(PillFormState.idle);
  }

  Future<void> editPill({
    required PillDto pill,
    required String name,
    required String dose,
  }) async {
    emit(PillFormState.saving);

    final res = await _api.apiPillsEditIdPut(
      id: pill.pillID,
      body: PillDto(
        pillID: pill.pillID,
        pillName: name,
        pillDose: dose,
      ),
    );

    if (res.isSuccessful) {
      emitPresentation(PillFormSaveSuccessEvent());
    } else {
      emitPresentation(PillFormSaveErrorEvent());
    }

    emit(PillFormState.idle);
  }
}

enum PillFormState { idle, saving }

class PillsChangedMessage {}

sealed class PillFormSaveEvent {}

class PillFormSaveSuccessEvent extends PillFormSaveEvent {}

class PillFormSaveErrorEvent extends PillFormSaveEvent {}
