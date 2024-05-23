import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const background = Color(0xFFEAECEB);
  static const disabled = Color(0xFFD3D5D8);
  static const textHint = Color(0xFFAFB2BC);
  static const textDark = Color(0xFF414657);

  static const red = Color(0xFFFF8087);
}

class AppTheme {
  static final ligthTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.red,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.red,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textDark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.disabled,
        disabledForegroundColor: AppColors.background,
        minimumSize: const Size.fromHeight(48.0),
        elevation: 16.0,
        shadowColor: AppColors.red.withOpacity(.24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textHint,
      ),
      errorStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.red,
      ),
      contentPadding: EdgeInsets.only(
        left: 16,
        top: 12,
        right: 16,
        bottom: 8,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.textDark,
      selectionHandleColor: AppColors.red,
    ),
  );
}
