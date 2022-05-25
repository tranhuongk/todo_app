import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:todo_app/app/translations/app_translations.dart';

enum TaskStatus {
  all,
  complete,
  incomplete,
  inprocess,
}

extension ExString on String? {
  TaskStatus get toTaskStatus {
    switch (this) {
      case AppTranslationKey.complete:
        return TaskStatus.complete;
      case AppTranslationKey.incomplete:
        return TaskStatus.incomplete;
      case AppTranslationKey.inprocess:
        return TaskStatus.inprocess;
      default:
        return TaskStatus.all;
    }
  }
}

extension ExEnum on TaskStatus {
  String get string {
    switch (this) {
      case TaskStatus.all:
        return AppTranslationKey.all.tr;
      case TaskStatus.complete:
        return AppTranslationKey.complete.tr;
      case TaskStatus.incomplete:
        return AppTranslationKey.incomplete.tr;
      case TaskStatus.inprocess:
        return AppTranslationKey.inprocess.tr;
    }
  }

  String get key {
    switch (this) {
      case TaskStatus.all:
        return AppTranslationKey.all;
      case TaskStatus.complete:
        return AppTranslationKey.complete;
      case TaskStatus.incomplete:
        return AppTranslationKey.incomplete;
      case TaskStatus.inprocess:
        return AppTranslationKey.inprocess;
    }
  }

  Color get color {
    switch (this) {
      case TaskStatus.all:
        return AppColors.kPrimaryColor;
      case TaskStatus.complete:
        return AppColors.green;
      case TaskStatus.incomplete:
        return AppColors.red;
      case TaskStatus.inprocess:
        return AppColors.yellow;
    }
  }
}
