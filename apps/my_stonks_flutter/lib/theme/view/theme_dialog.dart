import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';
import 'package:my_stonks_flutter/theme/data/theme_type.dart';
import 'package:my_stonks_flutter/theme/theme.dart';

class ThemeSelectionDialog extends StatelessWidget {
  const ThemeSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.homeThemeTitle),
      content: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioGroup<ThemeType>(
                groupValue: themeState.theme,
                onChanged: (ThemeType? value) async {
                  if (value != null) {
                    await context.read<ThemeCubit>().setTheme(value);
                    if (!context.mounted) {
                      return;
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Column(
                  children: [
                    RadioListTile<ThemeType>(
                      title: Text(l10n.homeThemeRetailBankText),
                      value: ThemeType.retailBank,
                    ),
                    RadioListTile<ThemeType>(
                      title: Text(l10n.homeThemeNeoankText),
                      value: ThemeType.neobank,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          child: Text(l10n.homeThemeCancelText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
