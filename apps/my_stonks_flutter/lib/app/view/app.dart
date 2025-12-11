import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/home/view/home_page.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';
import 'package:my_stonks_flutter/theme/cubit/theme_cubit.dart';
import 'package:my_stonks_flutter/theme/data/theme_repository.dart';
import 'package:my_stonks_flutter/theme/data/theme_type.dart';
import 'package:my_stonks_flutter/theme/view/my_stonks_theme.dart';

class App extends StatelessWidget {
  const App({
    required this.assetsRepository,
    required this.themeRepository,
    super.key,
  });

  final AssetsRepository assetsRepository;
  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => assetsRepository),
        RepositoryProvider(create: (_) => themeRepository),
      ],
      child: BlocProvider(
        create: (context) => ThemeCubit(
          themeRepository: themeRepository,
        )..init(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeCubit cubit) => cubit.state.theme);
    return MaterialApp(
      theme: theme == ThemeType.retailBank
          ? FlutterMyStonksTheme.retailBankTheme
          : FlutterMyStonksTheme.neobankTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
