import 'package:flutter/foundation.dart';

abstract class BaseViewModel<T> extends ChangeNotifier {
  late T view;
  bool loading = false;
  String? errorMessage;

  // ignore: avoid_positional_boolean_parameters
  void toggleLoadingOn(bool on) {
    loading = on;
  }

  void setErrorMessage(String value) {
    errorMessage = value;
  }

  void attachView(T view) {
    this.view = view;
  }
}
