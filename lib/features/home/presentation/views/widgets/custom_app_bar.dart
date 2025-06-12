import 'package:bookly_app/core/theme/theme_data_enum.dart';
import 'package:bookly_app/core/theme/theme_state.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/manager/theme_cubit/theme_cubit_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 20),
      child: Row(
        children: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isDark = state.mode == AppThemeMode.dark;
              return IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                icon: Icon(
                  isDark ? Icons.wb_sunny_outlined : Icons.nightlight_round,
                  color: isDark ? Colors.white : Colors.black,
                  size: 24,
                ),
              );
            },
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.KSearchView);
            },
            icon: Icon(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
