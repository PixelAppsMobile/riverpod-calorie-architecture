import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/data/repositories/admin/admin_repo_impl.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';

final adminRepo = Provider.autoDispose((ref) => AdminRepoImpl());

abstract class AdminRepo {
  Future<List<UserProfile>> fetchAllUsers();
  // Future<List<FoodEntry>> getFoodEntriesForUser(UserProfile user);
}
