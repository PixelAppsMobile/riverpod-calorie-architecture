import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewStateNotifier<T, V> extends StateNotifier<V> {
  late T? view;

  BaseViewStateNotifier(V state) : super(state);

  void attachView(T view) {
    this.view = view;
  }

  void detachView() {
    view = null;
  }
}
