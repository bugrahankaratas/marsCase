import 'package:flutter/material.dart';
import 'package:mars_case/utils/theme/colors.dart';

class ColorTheme {
  late final ThemeData theme;

  ColorTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        color: AppColors.appColor.transparent,
      ),
      scaffoldBackgroundColor: AppColors.appColor.brown200,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.appColor.brown400),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(onPrimary: AppColors.appColor.white),
      ),
    );
  }
}
