import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:totaltest/data/helper/prefs_helper/shared_prefs_helper.dart';
import 'package:totaltest/main.dart';
import 'package:totaltest/main.mocks.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page.dart';

///GoodReads: https://medium.com/swlh/3-tricks-to-test-your-widgets-with-flutter-more-comfortably-88fcae5616cc

void main() {
  const userToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImlhdCI6MTY1MTUxMjMxMSwiZXhwIjoxNjUxNTE1OTExLCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay16dWlxMkB0b3B0YWxjYWxvcmllbWV0cmUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay16dWlxMkB0b3B0YWxjYWxvcmllbWV0cmUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJ1aWQiOiJ1MzNaSm5IWDNYUU9zSUVaSU9neFQya2x2S3QxIn0.nC0V-ziPX-JXy17c7cncZRaX-60dM2LtSGv9TEDFvX1H0kvEULfIeruYKJKDcAFwXq8Hv47laAgh3sGHOX4y3GJux5pt2rOLYwKedpbITo7AMbJrqAj1mMCxscXPWFbIdeBd3DLeSPz4hzmIOZREnWUyKNiXR5rvIEkRNsqOB4ozydpxdf9aRCuNr8_trZOCdp0dA-iSXT5n7IDVLhPdm53ZwtJBMiMOouAaItCjxQTFcmp-A0bbhystfMtauy2C5UBv6uC7yq5xP4mPsfT6eSZxneeUDsCbhTxW2Iljfwydi924XDxA91X_w0amIXnQxXVLWFcx48ikM5zsj6wrKg";

  testWidgets("User signs up and sees food items on homepage",
      (WidgetTester tester) async {
    await Firebase.initializeApp();
    await tester.pumpWidget(const ProviderScope(overrides: [], child: MyApp()));

    // The default value is `0`, as declared in our provider
    expect(find.text('Calories Tracker'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Calories Tracker'), findsNothing);

    await tester.enterText(find.byKey(customTokenTextField), userToken);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.tap(find.text("Submit"));
    await tester.pumpAndSettle();
    bool circularIndicatorRan = false;
    for (int i = 0; i < 100; i++) {
      final finderResult = find.byType(CircularProgressIndicator);
      if (finderResult.evaluate().length == 1) {
        circularIndicatorRan = true;
        break;
      }
      await tester.pump(const Duration(milliseconds: 50));
    }
    if (!circularIndicatorRan) fail("Circular Indicator was not displayed");
    bool foundListItems = false;
    for (int i = 0; i < 100; i++) {
      final finderResult = find.byType(ListTile);
      if (finderResult.evaluate().isNotEmpty) {
        foundListItems = true;
        break;
      }
      await tester.pump(const Duration(milliseconds: 50));
    }
    if (!foundListItems) fail("No items were displayed in the home page list");
  });
}
