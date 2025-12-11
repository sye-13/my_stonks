import 'package:my_stonks_flutter/theme/data/theme_api.dart';
import 'package:my_stonks_flutter/theme/data/theme_type.dart';

class ThemeRepository {
  ThemeRepository({
    required ThemeApi api,
  }) : _api = api;

  final ThemeApi _api;

  Future<void> saveTheme(ThemeType themeType) => _api.saveTheme(themeType);

  ThemeType getSavedTheme() => _api.getSavedTheme();
}
