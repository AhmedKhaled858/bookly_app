import 'theme_data_enum.dart';

class ThemeState {
  final  AppThemeMode mode;

  ThemeState({required this.mode});
  ThemeState copyWith({AppThemeMode? mode}) {
    return ThemeState(
      mode: mode ?? this.mode,
    );
  }
}