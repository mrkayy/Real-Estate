import 'package:flutter/material.dart';
import 'package:takehome/core/theme/app_colors.dart';

class LightTheme {
  static ThemeData light =
      ThemeData(useMaterial3: false, fontFamily: "Euclid").copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
  );
}
