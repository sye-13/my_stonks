import 'package:my_stonks_flutter/theme/data/theme_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeApi {
  ThemeApi({
    required SharedPreferencesWithCache plugin,
  }) : _plugin = plugin;

  final SharedPreferencesWithCache _plugin;

  static const kMyStonksThemeKey = '__my_stonks_theme_key__';

  Future<void> saveTheme(ThemeType themeType) async {
    await _plugin.setString(kMyStonksThemeKey, themeType.name);
  }

  ThemeType getSavedTheme() {
    final value = _plugin.getString(kMyStonksThemeKey) ?? '';
    return ThemeType.fromKey(value) ?? ThemeType.retailBank;
  }
}
