import 'package:bloc_test/bloc_test.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:server/server.dart';

import '../../helpers/l10n.dart';
import '../../helpers/pump_app.dart';

class MockAssetsRepository extends Mock implements AssetsRepository {}

class MockAssetsOverviewBloc
    extends MockBloc<AssetsOverviewEvent, AssetsOverviewState>
    implements AssetsOverviewBloc {}

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
  late AssetsRepository assetsRepository;

  group('AssetsOverviewPage', () {
    setUp(() {
      assetsRepository = MockAssetsRepository();
      when(assetsRepository.getAssets).thenAnswer((_) => const Stream.empty());
    });

    testWidgets('renders AssetsOverviewView', (tester) async {
      await tester.pumpApp(
        const AssetsOverviewPage(),
        assetsRepository: assetsRepository,
      );

      expect(find.byType(AssetsOverviewView), findsOneWidget);
    });

    testWidgets(
      'subscribes to assets from repository on initialization',
      (tester) async {
        await tester.pumpApp(
          const AssetsOverviewPage(),
          assetsRepository: assetsRepository,
        );

        verify(() => assetsRepository.getAssets()).called(1);
      },
    );
  });

  group('AssetsOverviewView', () {
    late MockNavigator navigator;
    late AssetsOverviewBloc assetsOverviewBloc;

    setUp(() {
      navigator = MockNavigator();
      when(() => navigator.canPop()).thenReturn(false);
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      assetsOverviewBloc = MockAssetsOverviewBloc();
      when(() => assetsOverviewBloc.state).thenReturn(
        AssetsOverviewState(
          status: AssetsOverviewStatus.success,
          assets: mockAssets,
        ),
      );
      assetsRepository = MockAssetsOverviewRepository();
      when(assetsRepository.getAssets).thenAnswer((_) => const Stream.empty());
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: assetsOverviewBloc,
          child: const AssetsOverviewView(),
        ),
      );
    }

    testWidgets(
      'renders Text with title text',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          assetsRepository: assetsRepository,
        );

        expect(find.byKey(const Key('text_overview_title')), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.text(l10n.assetsOverviewAppBarTitle),
          ),
          findsOneWidget,
        );
      },
    );

    group('when assets is empty', () {
      setUp(() {
        when(
          () => assetsOverviewBloc.state,
        ).thenReturn(const AssetsOverviewState());
      });

      testWidgets(
        'renders nothing '
        'when status is initial or error',
        (tester) async {
          await tester.pumpApp(
            buildSubject(),
            assetsRepository: assetsRepository,
          );

          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CircularProgressIndicator), findsNothing);
        },
      );

      testWidgets(
        'renders loading indicator '
        'when status is loading',
        (tester) async {
          when(() => assetsOverviewBloc.state).thenReturn(
            const AssetsOverviewState(status: AssetsOverviewStatus.loading),
          );

          await tester.pumpApp(
            buildSubject(),
            assetsRepository: assetsRepository,
          );

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );

      testWidgets(
        'renders assets empty text '
        'when status is success',
        (tester) async {
          when(() => assetsOverviewBloc.state).thenReturn(
            const AssetsOverviewState(
              status: AssetsOverviewStatus.success,
            ),
          );

          await tester.pumpApp(
            buildSubject(),
            assetsRepository: assetsRepository,
          );

          expect(find.text(l10n.assetsOverviewEmptyText), findsOneWidget);
        },
      );
    });

    group('when assets is not empty', () {
      setUp(() {
        when(() => assetsOverviewBloc.state).thenReturn(
          AssetsOverviewState(
            status: AssetsOverviewStatus.success,
            assets: mockAssets,
          ),
        );
      });

      testWidgets('renders ListView with AssetCard', (tester) async {
        await tester.pumpApp(
          buildSubject(),
          assetsRepository: assetsRepository,
        );

        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(AssetCard), findsNWidgets(mockAssets.length));
      });
    });

    testWidgets(
      'navigates to AssetPerformancePage '
      'when AssetCard.onTap is called',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          assetsRepository: assetsRepository,
        );

        final assetCard = tester.widget<AssetCard>(
          find.byType(AssetCard).first,
        );
        assetCard.onTap(mockAssets.first);

        verify(
          () => navigator.push<void>(any(that: isRoute<void>())),
        ).called(1);
      },
    );
  });
}
