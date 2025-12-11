part of 'theme_cubit.dart';

final class ThemeState extends Equatable {
  const ThemeState({
    this.theme = ThemeType.retailBank,
  });

  final ThemeType theme;

  ThemeState copyWith({
    ThemeType Function()? theme,
  }) {
    return ThemeState(theme: theme != null ? theme() : this.theme);
  }

  @override
  List<Object> get props => [theme];
}
