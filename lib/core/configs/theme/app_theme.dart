import 'package:flutter/material.dart';
import 'package:weather/core/configs/theme/app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.white,

    scaffoldBackgroundColor: AppColors.background,

    // * ============> This Text theme <============ * //
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),

    // * ============> Appbar theme <============ * //
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),

    // * ============> This Input Text field theme <============ * //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondBackground,

      hintStyle: const TextStyle(
        color: AppColors.thirdBackground,
        fontWeight: FontWeight.w400,
        height: 0.6,
      ),

      suffixIconColor: AppColors.thirdBackground,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
