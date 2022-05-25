import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:todo_app/app/themes/app_text_styles.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.kPrimaryColor,
    ),
    fontFamily: "Filson Pro",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 0,
      color: AppColors.background,
      elevation: 0,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextStyles.base.filsonPro,
      ),
      primaryContrastingColor: AppColors.black,
      primaryColor: AppColors.black,
    ),
  );
}
