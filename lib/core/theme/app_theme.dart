import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
      // fontFamily: TextStyleTheme.tajawalFont,
      // scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        // backgroundColor: AppColors.background,
        elevation: 0,
        // iconTheme: IconThemeData(color: AppColors.primary),
      ),
    );
  }
}