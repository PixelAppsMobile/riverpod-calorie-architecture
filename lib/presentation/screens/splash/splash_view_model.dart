import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/use_cases/init_services/init_local_storage_use_case.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';

final splashScreenViewModel =
    StateNotifierProvider<SplashScreenViewModel, bool>(
  (ref) => SplashScreenViewModel(
    ref.read(userProvider.notifier),
    ref.read(initLocalStorageUseCase),
  ),
);

class SplashScreenViewModel extends StateNotifier<bool> {
  final InitLocalStorageUseCase _initLocalStorageUseCase;

  final UserProvider _userProvider;

  SplashScreenViewModel(this._userProvider, this._initLocalStorageUseCase)
      : super(false);

  Future initialize() async {
    state = true;

    await _initLocalStorageUseCase();
    await _userProvider.initialize();

    state = false;
  }
}
