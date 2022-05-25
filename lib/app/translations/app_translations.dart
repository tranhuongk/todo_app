import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/translations/en_us.dart';
import 'package:todo_app/app/translations/vi_vn.dart';

class AppTranslationKey {
  AppTranslationKey._();

  // API Error
  static String get unknownError => "unknownError".tr;
  static String get timeoutError => "timeoutError".tr;
  static String get noConnectionError => "noConnectionError".tr;
  static String get unauthorizedError => "unauthorizedError".tr;
  static String get tryAgain => "tryAgain".tr;
  static String get identify => "identify".tr;
  static String get error => "error".tr;
  static String get successful => "successful".tr;
  static String get notMatch => "notMatch".tr;
  static String get noEmpty => "noEmpty".tr;
  static String get noRecords => "noRecords".tr;
  static String get pleaseLogin => "pleaseLogin".tr;
  static String get noData => "noData".tr;
  static String get enterText => "enterText".tr;

  /// Task
  static const String all = "all";
  static const String complete = "complete";
  static const String incomplete = "incomplete";
  static const String inprocess = "inprocess";
  static String get task => "task".tr;
  static String get totaNumberTasks => "total_number_tasks".tr;
  static String get statusNowQs => "status_now_qs".tr;
  static String get addTask => "add_task".tr;
  static String get save => "save".tr;
}

class AppTranslation {
  AppTranslation._();

  static const Locale locale = Locale('en');
  static final Map<String, Map<String, String>> translations = {
    'en': enUS,
    'vi': viVN,
  };
}
