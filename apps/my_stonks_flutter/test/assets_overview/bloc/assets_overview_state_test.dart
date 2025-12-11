import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:server/server.dart';

void main() {
  group('AssetsOverviewState', () {
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
    AssetsOverviewState createSubject({
      AssetsOverviewStatus status = AssetsOverviewStatus.initial,
      List<AssetWithPerformanceHistory>? assets,
    }) {
      return AssetsOverviewState(
        status: status,
        assets: assets ?? mockAssets,
      );
    }

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject(
          assets: mockAssets,
        ).props,
        equals(<Object?>[
          AssetsOverviewStatus.initial,
          mockAssets,
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });
    });

    test('retains the old value for every parameter if null is provided', () {
      expect(
        createSubject().copyWith(
          status: null,
          assets: null,
        ),
        equals(createSubject()),
      );
    });

    test('replaces every non-null parameter', () {
      expect(
        createSubject().copyWith(
          status: () => AssetsOverviewStatus.success,
          assets: () => [],
        ),
        equals(
          createSubject(
            status: AssetsOverviewStatus.success,
            assets: [],
          ),
        ),
      );
    });
  });
}
