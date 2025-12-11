// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_stonks_flutter/app/app.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/theme/theme.dart';

import '../../helpers/helpers.dart';

class MockThemeCubit extends MockCubit<ThemeState> implements ThemeCubit {}

void main() {
  late AssetsRepository assetsRepository;
  late ThemeRepository themeRepository;
  late ThemeCubit themeCubit;

  setUp(() {
    assetsRepository = MockAssetsOverviewRepository();
    themeRepository = MockThemeRepository();
    themeCubit = MockThemeCubit();
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      when(() => themeCubit.state).thenReturn(const ThemeState());
      await tester.pumpApp(
        AppView(),
        assetsRepository: assetsRepository,
        themeRepository: themeRepository,
        themeCubit: themeCubit..init(),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
