import 'package:flutter/material.dart';

class AppColors {
  static const Color darkTextColor = Color(0xFFEEEEEE); // Soft white
  static const Color lightTextColor = Color(0xFF222222); // Dark gray (better for readability)
  static const Color lightBackground = Color(0xFFF5F5F5); // Soft off-white
  static const Color darkBackground = Color(0xFF121212); // Deep dark background
}

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.darkTextColor, 
      fontSize: 18.0, 
      fontWeight: FontWeight.w500, 
      letterSpacing: 0.4,
    ),
    bodyMedium: TextStyle(
      color: AppColors.darkTextColor, 
      fontSize: 16.0, 
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: AppColors.darkTextColor, 
      fontSize: 20.0, 
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: AppColors.darkTextColor, 
      fontSize: 22.0, 
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: AppColors.darkTextColor, 
      fontSize: 14.0, 
      fontWeight: FontWeight.w400,
    ),
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.lightBackground,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.lightTextColor, 
      fontSize: 18.0, 
      fontWeight: FontWeight.w500, 
      letterSpacing: 0.4,
    ),
    bodyMedium: TextStyle(
      color: AppColors.lightTextColor, 
      fontSize: 16.0, 
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: AppColors.lightTextColor, 
      fontSize: 20.0, 
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: AppColors.lightTextColor, 
      fontSize: 22.0, 
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: AppColors.lightTextColor, 
      fontSize: 14.0, 
      fontWeight: FontWeight.w400,
    ),
  ),
);
