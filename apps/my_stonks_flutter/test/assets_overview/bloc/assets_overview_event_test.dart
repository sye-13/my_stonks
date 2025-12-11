import 'package:flutter_test/flutter_test.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';

void main() {
  group('AssetsOverviewEvent', () {
    group('AssetsOverviewSubscriptionRequested', () {
      test('supports value equality', () {
        expect(
          const AssetsOverviewSubscriptionRequested(),
          equals(
            const AssetsOverviewSubscriptionRequested(),
          ),
        );
      });
      test('props are correct', () {
        expect(
          const AssetsOverviewSubscriptionRequested().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}
