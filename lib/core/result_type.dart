import 'package:flutter/foundation.dart';

class AppError {
  final String title;
  final String? description;
  AppError({this.title = "", this.description = ""});
  @override
  int get hashCode => title.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppError &&
          other.title == title &&
          other.description == description);

  void log([String? eventName]) {
    if (!kDebugMode && eventName != null) {
      /// Log to crashlytics
      //   FirebaseCrashlytics.instance.recordError(
      //       Exception(title), StackTrace.fromString(eventName),
      //       reason: description);
    }
  }
}

class AppSuccess {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppSuccess;

  @override
  int get hashCode => super.hashCode;
}

AppError getLoggedError(String analyticsKey,
    {String title = "", String description = ""}) {
  AppError appError = AppError(title: title, description: description);
  appError.log(analyticsKey);
  return appError;
}
