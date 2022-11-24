import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';

@GenerateMocks([LocalStorageDataSource])
void main() {
  const userToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImlhdCI6MTY1MTUxMjMxMSwiZXhwIjoxNjUxNTE1OTExLCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay16dWlxMkB0b3B0YWxjYWxvcmllbWV0cmUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay16dWlxMkB0b3B0YWxjYWxvcmllbWV0cmUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJ1aWQiOiJ1MzNaSm5IWDNYUU9zSUVaSU9neFQya2x2S3QxIn0.nC0V-ziPX-JXy17c7cncZRaX-60dM2LtSGv9TEDFvX1H0kvEULfIeruYKJKDcAFwXq8Hv47laAgh3sGHOX4y3GJux5pt2rOLYwKedpbITo7AMbJrqAj1mMCxscXPWFbIdeBd3DLeSPz4hzmIOZREnWUyKNiXR5rvIEkRNsqOB4ozydpxdf9aRCuNr8_trZOCdp0dA-iSXT5n7IDVLhPdm53ZwtJBMiMOouAaItCjxQTFcmp-A0bbhystfMtauy2C5UBv6uC7yq5xP4mPsfT6eSZxneeUDsCbhTxW2Iljfwydi924XDxA91X_w0amIXnQxXVLWFcx48ikM5zsj6wrKg";
  test("Food items fetch returns not empty list for a user", () async {
    await Firebase.initializeApp();
    final ProviderContainer container = ProviderContainer();
    await container.read(localStorageDataSource).init();
    final _signInResponse =
        await container.read(userProvider.notifier).signIn(userToken);
    expect(_signInResponse.isRight(), true, reason: "Couldn't sign in user");
    final _result = await container.read(foodConsumptionRepo).getFoodEntries();
    expect(_result.isRight(), true,
        reason: "Failed to fetch food entries from firebase");
    expect(_result.fold((l) => [], (r) => r).isNotEmpty, true,
        reason: "Food items list is empty");
  });
}
