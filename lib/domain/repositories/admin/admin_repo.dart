import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/data/repositories/admin/admin_repo_impl.dart';

final adminRepo = Provider.autoDispose((ref) => AdminRepoImpl());

abstract class AdminRepo {
  Future<List<UserProfileDto>> fetchAllUsers();
  // Future<List<FoodEntry>> getFoodEntriesForUser(UserProfile user);
}
