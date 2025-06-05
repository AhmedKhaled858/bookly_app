import 'package:bookly_app/core/theme/theme_data_enum.dart';

class ToggleThemeUseCase {
  AppThemeMode toggleTheme(AppThemeMode currentMode) {
    return currentMode == AppThemeMode.light
        ? AppThemeMode.dark
        : AppThemeMode.light;
  }
}