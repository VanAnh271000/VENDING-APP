import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF2979FF);
  static const Color secondary = Color(0xFFFFA000);

  // Background
  static const Color background = Color(0xFFF5F7FA);
  static const Color card = Colors.white;

  //Icon
  static const Color iconPrimary = Colors.blueAccent;
  static const Color iconSecondary = Colors.white;
  // Text
  static const Color textPrimary = Colors.blueAccent;
  static const Color textSecondary = Colors.grey;
  static const Color textTertiary = Colors.white;

  // Status
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);

  // Border / Divider
  static const Color divider = Color(0xFFF1F0F0);
}
const ColorScheme appColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: Colors.white,
  secondary: AppColors.secondary,
  onSecondary: Colors.white,
  error: AppColors.error,
  onError: Colors.white,
  background: AppColors.background,
  onBackground: AppColors.textPrimary,
  surface: AppColors.card,
  onSurface: AppColors.textPrimary,
);
