import 'dart:developer';
import 'package:todo_app/app/translations/app_translations.dart';

abstract class ApiErrors implements Exception {
  final String message = "";
  ApiErrors({String? name}) {
    log(message, name: name ?? "");
  }
}

class UnknownError extends ApiErrors {
  @override
  String get message => AppTranslationKey.unknownError;
  UnknownError() : super(name: 'UnknownError');
}

class TimeoutError extends ApiErrors {
  @override
  String get message => AppTranslationKey.timeoutError;
  TimeoutError() : super(name: 'TimeoutError');
}

class NoConnectionError extends ApiErrors {
  @override
  String get message => AppTranslationKey.noConnectionError;
  NoConnectionError() : super(name: 'NoConnectionError');
}

class UnauthorizedError extends ApiErrors {
  @override
  String get message => AppTranslationKey.unauthorizedError;
  UnauthorizedError() : super(name: 'UnauthorizeError');
}

class ServerResError extends ApiErrors {
  @override
  // ignore: overridden_fields
  final String message;
  ServerResError(this.message) : super(name: 'ServerResError');
}
