import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/theme_data_enum.dart';
import '../../../../../core/theme/theme_state.dart';
import '../../../domain/usecase/toggle_theme_use_case.dart';

part 'theme_cubit_dart_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ToggleThemeUseCase _toggleUseCase;

  ThemeCubit(this._toggleUseCase)
      : super(ThemeState(mode: AppThemeMode.light));

  void toggleTheme() {
    final newMode = _toggleUseCase.toggleTheme(state.mode);
    emit(state.copyWith(mode: newMode));
  }
}
