import 'package:flutter/material.dart';
import 'package:todo_app/app/themes/app_colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? backgroundColor,
    double? elevation,
    Brightness? brightness,
    double? toolbarHeight,
  }) : super(
          key: key,
          backgroundColor: backgroundColor ?? AppColors.white,
          elevation: elevation ?? 0,
          toolbarHeight: toolbarHeight ?? 0,
        );
}
