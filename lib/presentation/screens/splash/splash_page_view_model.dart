import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/use_cases/init_services/init_local_storage_use_case.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/splash/state/splash_page_view_state.dart';

class SplashPageViewModel extends StateNotifier<SplashPageViewState> {
  final InitLocalStorageUseCase _initLocalStorageUseCase;

  final UserProvider _userProvider;

  SplashPageViewModel(this._userProvider, this._initLocalStorageUseCase)
      : super(const SplashPageViewState.loading()) {
    _initialize();
  }

  Future _initialize() async {
    state = const SplashPageViewState.loading();

    await _initLocalStorageUseCase();
    await _userProvider.initialize();

    _userProvider.addListener((user) {
      state = SplashPageViewState.ready(user);
    });
  }
}
