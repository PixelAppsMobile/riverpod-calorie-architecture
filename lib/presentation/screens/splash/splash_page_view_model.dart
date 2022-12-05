import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/providers/init_services/init_services_provider.dart';
import 'package:totaltest/presentation/screens/splash/state/splash_page_view_state.dart';

class SplashPageViewModel extends StateNotifier<SplashPageViewState> {
  final InitServicesProvider _initServicesProvider;

  SplashPageViewModel(
    this._initServicesProvider,
  ) : super(const SplashPageViewState.loading()) {
    _initialize();
  }

  Future _initialize() async {
    state = const SplashPageViewState.loading();

    await _initServicesProvider.initialise();

    state = const SplashPageViewState.ready();
  }
}
