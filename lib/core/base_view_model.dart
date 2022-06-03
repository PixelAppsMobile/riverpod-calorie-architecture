import 'package:flutter/foundation.dart';

abstract class BaseViewModel<T> extends ChangeNotifier {
  late T? view;
  bool loading = false;
  String? errorMessage;

  // ignore: avoid_positional_boolean_parameters
  ///[turnOffNotifyListeners] should be set to true when notifyListeners() need
  ///not to be called
  void toggleLoadingOn(bool on, {bool turnOffNotifyListeners = false}) {
    loading = on;
    if (!turnOffNotifyListeners) notifyListeners();
  }

  void setErrorMessage(String value) {
    errorMessage = value;
  }

  void attachView(T view) {
    this.view = view;
  }

  void detachView() {
    this.view = null;
  }
}
