import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';

class MockAssetsOverviewRepository extends Mock implements AssetsRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    AssetsRepository? assetsRepository,
  }) {
    return pumpWidget(
      RepositoryProvider.value(
        value: assetsRepository ?? MockAssetsOverviewRepository(),
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
