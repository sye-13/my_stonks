// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:my_stonks_flutter/app/app.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/home/home.dart';
import 'package:my_stonks_flutter/theme/theme.dart';

import '../../helpers/helpers.dart';

void main() {
  late AssetsRepository assetsRepository;
  late ThemeRepository themeRepository;

  setUp(() {
    assetsRepository = MockAssetsOverviewRepository();
    themeRepository = MockThemeRepository();
  });

  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(
          assetsRepository: assetsRepository,
          themeRepository: themeRepository,
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
