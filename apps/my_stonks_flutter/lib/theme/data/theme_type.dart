enum ThemeType {
  retailBank('retailBank'),
  neobank('neobank');

  const ThemeType(this.key);

  final String key;

  static ThemeType? fromKey(String key) {
    try {
      return ThemeType.values.firstWhere((e) => e.key == key);
    } catch (_) {
      return null;
    }
  }
}
