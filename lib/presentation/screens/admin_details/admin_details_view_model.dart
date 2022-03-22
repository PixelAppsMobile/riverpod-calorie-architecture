import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';

final adminDetailsViewModel =
    ChangeNotifierProvider((ref) => AdminDetailsViewModel());

class AdminDetailsViewModel extends ChangeNotifier {
  late final UserProfile _currentUser;

  UserProfile get currentUser => _currentUser;

  set currentUser(UserProfile val) {
    _currentUser = val;
    notifyListeners();
  }
}
