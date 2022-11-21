import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/domain/models/app_user.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/main.dart';
import 'package:totaltest/main.mocks.dart';

///State Notfier can't be mocked with mockito
///https://github.com/rrousselGit/riverpod/issues/273
@GenerateMocks([LocalStorageDataSource, FoodConsumptionRepo, UserProvider])
void main() {
  const userToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImlhdCI6MTY1MTUxMjMxMSwiZXhwIjoxNjUxNTE1OTExLCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay16dWlxMkB0b3B0YWxjYWxvcmllbWV0cmUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay16dWlxMkB0b3B0YWxjYWxvcmllbWV0cmUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJ1aWQiOiJ1MzNaSm5IWDNYUU9zSUVaSU9neFQya2x2S3QxIn0.nC0V-ziPX-JXy17c7cncZRaX-60dM2LtSGv9TEDFvX1H0kvEULfIeruYKJKDcAFwXq8Hv47laAgh3sGHOX4y3GJux5pt2rOLYwKedpbITo7AMbJrqAj1mMCxscXPWFbIdeBd3DLeSPz4hzmIOZREnWUyKNiXR5rvIEkRNsqOB4ozydpxdf9aRCuNr8_trZOCdp0dA-iSXT5n7IDVLhPdm53ZwtJBMiMOouAaItCjxQTFcmp-A0bbhystfMtauy2C5UBv6uC7yq5xP4mPsfT6eSZxneeUDsCbhTxW2Iljfwydi924XDxA91X_w0amIXnQxXVLWFcx48ikM5zsj6wrKg";

  testWidgets(
      "A logged in user sees home page with food list items after opening the app",
      (WidgetTester tester) async {
    await Firebase.initializeApp();
    final mockUser = MockUser();
    final mockUserProviderInstance = MockUserProvider(
        AppUser(user: mockUser, calorieLimit: 2100, role: UserRole.Normal));
    final mockFoodConsumptionRepoInstance = MockFoodConsumptionRepoImpl();

    final mockUserProvider = StateNotifierProvider<UserProvider, AppUser?>(
        (ref) => mockUserProviderInstance);

    when(mockFoodConsumptionRepoInstance.getFoodEntries()).thenAnswer(
        (realInvocation) =>
            Future.delayed(Duration(milliseconds: Random().nextInt(500))).then(
                (value) => Right([
                      FoodEntry(
                          name: "Banana",
                          time: DateTime.now(),
                          calorificValue: 2100)
                    ])));
    await tester.pumpWidget(ProviderScope(overrides: [
      foodConsumptionRepo.overrideWithValue(mockFoodConsumptionRepoInstance),
      userProvider.overrideWithProvider(mockUserProvider),
    ], child: const MyApp()));

    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(find.text("Banana"), findsOneWidget);
  });
}

class MockUserProvider extends StateNotifier<AppUser?> implements UserProvider {
  MockUserProvider(AppUser? state) : super(state);

  @override
  Future<void> initialize() async {}

  @override
  Future<Either<AppError, AppSuccess>> signIn(String customToken) async {
    return Future.delayed(Duration(milliseconds: Random().nextInt(500)))
        .then((value) => Right(AppSuccess()));
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(double limit) {
    // TODO: implement updateCalorieLimit
    throw UnimplementedError();
  }
}
