import 'package:flutter/material.dart';

class AppColors {
  static const Color darkTextColor = Color(0xFFEEEEEE); // Soft white
  static const Color lightTextColor = Color(0xFF1A1A1A); // Near black
}
ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextColor),
    bodyMedium: TextStyle(color: AppColors.darkTextColor),
    titleMedium: TextStyle(color: AppColors.darkTextColor),
    titleLarge: TextStyle(color: AppColors.darkTextColor),
    labelLarge: TextStyle(color: AppColors.darkTextColor),
  ),
);
ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightTextColor),
    bodyMedium: TextStyle(color: AppColors.lightTextColor),
    titleMedium: TextStyle(color: AppColors.lightTextColor),
    titleLarge: TextStyle(color: AppColors.lightTextColor),
    labelLarge: TextStyle(color: AppColors.lightTextColor),
  ),
);