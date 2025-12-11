import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_stonks_flutter/theme/data/theme_type.dart';
import 'package:my_stonks_flutter/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository,
       super(const ThemeState());

  final ThemeRepository _themeRepository;

  void init() {
    final theme = _themeRepository.getSavedTheme();
    emit(state.copyWith(theme: () => theme));
  }

  Future<void> setTheme(ThemeType theme) async {
    emit(state.copyWith(theme: () => theme));
    await _themeRepository.saveTheme(theme);
  }
}
