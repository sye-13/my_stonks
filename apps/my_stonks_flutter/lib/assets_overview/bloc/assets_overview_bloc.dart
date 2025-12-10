import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:server/server.dart';

part 'assets_overview_event.dart';

part 'assets_overview_state.dart';

class AssetsOverviewBloc
    extends Bloc<AssetsOverviewEvent, AssetsOverviewState> {
  AssetsOverviewBloc({
    required AssetsRepository assetsRepository,
  }) : _assetsRepository = assetsRepository,
       super(const AssetsOverviewState()) {
    on<AssetsOverviewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final AssetsRepository _assetsRepository;

  Future<void> _onSubscriptionRequested(
    AssetsOverviewEvent event,
    Emitter<AssetsOverviewState> emit,
  ) async {
    try {
      emit(state.copyWith(status: () => AssetsOverviewStatus.loading));

      await emit.forEach(
        _assetsRepository.getAssets(),
        onData: (assets) => state.copyWith(
          status: () => AssetsOverviewStatus.success,
          assets: () => assets,
        ),
        onError: (error, stack) {
          print('ON ERROR: $error - $stack');
          return state.copyWith(status: () => AssetsOverviewStatus.failure);
        },
      );
    } catch (e) {
      print('BLOC: ERROR: $e');
    }
  }
}
