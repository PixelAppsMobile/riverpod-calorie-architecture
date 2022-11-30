import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/use_cases/admin/get_all_users_use_case.dart';

final adminProvider = StateNotifierProvider(
  (ref) => AdminProvider(
    [],
    ref.read(getAllUsersUseCase),
  ),
);

class AdminProvider extends StateNotifier<List<UserProfile>?> {
  final GetAllUsersUseCase _getAllUsersUseCase;

  AdminProvider(
    List<UserProfile>? value,
    this._getAllUsersUseCase,
  ) : super(value);

  Future<Either<AppError, AppSuccess>> fetchUsers() async {
    final result = await _getAllUsersUseCase();

    return result.fold(
      (l) {
        state = [];
        return Left(l);
      },
      (r) {
        state = r.map((e) => e).toList().cast<UserProfile>();
        return Right(AppSuccess());
      },
    );
  }

  UserProfile getUserByUID(String uid) {
    return state!.where((element) => element.userId == uid).toList().first;
  }

  void updateUserProfile(UserProfile newUserProfile) {
    int userProfileIndex = state!.indexWhere(
      (element) => element.userId == newUserProfile.userId,
    );

    List<UserProfile> newUserProfileListState = [...state!];

    newUserProfileListState[userProfileIndex] = newUserProfile;

    state = newUserProfileListState;
  }
}
