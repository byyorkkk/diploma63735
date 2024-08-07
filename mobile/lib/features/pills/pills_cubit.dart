import 'package:adhd_project/common/util/decode_api_query.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/pills/pill_form/pill_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'pills_cubit.freezed.dart';

class PillsCubit extends Cubit<PillsState>
    with comms.Listener<PillsChangedMessage> {
  PillsCubit(this._api) : super(const PillsState.loading()) {
    listen();
  }

  final AdApi _api;

  final _logger = Logger('PillsCubit');

  Future<void> fetch() async {
    emit(const PillsState.loading());

    final pillsRes = await _api.apiPillsGet();

    if (pillsRes.isSuccessful) {
      final pills =
          decodeApiQuery(pillsRes.bodyString).map(PillDto.fromJson).toList();

      emit(
        PillsState.ready(
          pills: pills,
        ),
      );
      return;
    }

    _logger.shout(
      'Failed to load pills ',
      pillsRes.error,
    );

    emit(const PillsState.error());
  }

  @override
  void onMessage(PillsChangedMessage message) {
    fetch();
  }
}

@freezed
class PillsState with _$PillsState {
  const factory PillsState.loading() = PillsLoading;
  const factory PillsState.ready({
    required List<PillDto> pills,
  }) = PillsReady;
  const factory PillsState.error() = PillsError;
}
