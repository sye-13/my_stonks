import 'package:flutter/material.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';
import 'package:my_stonks_flutter/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeAppBarTitle),
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return const ThemeSelectionDialog();
                },
              );
            },
            icon: const Icon(Icons.brightness_6),
            tooltip: l10n.homeThemeTooltip,
          ),
        ],
      ),
      body: const AssetsOverviewPage(),
    );
  }
}
