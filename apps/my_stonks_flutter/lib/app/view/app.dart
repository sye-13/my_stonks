import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.assetsRepository,
    super.key,
  });

  final AssetsRepository assetsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => assetsRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const AssetsOverviewPage(),
    );
  }
}
