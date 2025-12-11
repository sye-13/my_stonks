import 'package:bloc_test/bloc_test.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:server/server.dart';

import '../../helpers/helpers.dart';

void main() {
  final mockAsset = AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_1'
        ..name = 'Company A'
        ..initialPrice = 1.0
        ..currentPrice = 2.0))
    ..history.addAll([
      PerformanceHistory()
        ..timestamp = Int64(DateTime.now().millisecondsSinceEpoch)
        ..value = 1.0,
    ]);
  final mockAssets = [mockAsset];

  group('AssetsOverviewBloc', () {
    late AssetsRepository assetsRepository;

    setUp(() {
      assetsRepository = MockAssetsOverviewRepository();
      when(
        () => assetsRepository.getAssets(),
      ).thenAnswer(
        (_) => Stream.value(mockAssets),
      );
    });

    AssetsOverviewBloc buildBloc() {
      return AssetsOverviewBloc(assetsRepository: assetsRepository);
    }

    group('constructor', () {
      test('works normally', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(buildBloc().state, equals(const AssetsOverviewState()));
      });
    });

    group('AssetsOverviewSubscriptionRequested', () {
      blocTest<AssetsOverviewBloc, AssetsOverviewState>(
        'starts listening to repository getAssets stream',
        build: buildBloc,
        act: (bloc) => bloc.add(const AssetsOverviewSubscriptionRequested()),
        verify: (_) {
          verify(() => assetsRepository.getAssets()).called(1);
        },
      );

      blocTest<AssetsOverviewBloc, AssetsOverviewState>(
        'emits state with updated status and assets '
            'when repository getAssets stream emits new assets',
        build: buildBloc,
        act: (bloc) => bloc.add(const AssetsOverviewSubscriptionRequested()),
        expect: () => [
          const AssetsOverviewState(
            status: AssetsOverviewStatus.loading,
          ),
          AssetsOverviewState(
            status: AssetsOverviewStatus.success,
            assets: mockAssets,
          ),
        ],
      );

      blocTest<AssetsOverviewBloc, AssetsOverviewState>(
        'emits state with failure status '
            'when repository getAssets stream emits error',
        setUp: () {
          reset(assetsRepository);
          when(() => assetsRepository.getAssets()).thenAnswer(
                (_) => Stream<List<AssetWithPerformanceHistory>>.error(
              Exception('oops'),
            ),
          );
        },
        build: buildBloc,
        act: (bloc) => bloc.add(const AssetsOverviewSubscriptionRequested()),
        expect: () => [
          const AssetsOverviewState(status: AssetsOverviewStatus.loading),
          const AssetsOverviewState(status: AssetsOverviewStatus.failure),
        ],
      );
    });
  });
}
