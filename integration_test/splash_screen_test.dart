import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:totaltest/data/helper/prefs_helper/shared_prefs_helper.dart';
import 'package:totaltest/domain/providers/user_provider.dart';
import 'package:totaltest/main.dart';
import 'package:totaltest/main.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:totaltest/main.mocks.dart';

@GenerateMocks([SharedPreferenceHelper])
void main() {
  testWidgets("failing test example", (WidgetTester tester) async {
    final mockPrefs = MockSharedPreferenceHelper();

    when(mockPrefs.init()).thenAnswer((realInvocation) => null);
    // when(mockUserProvider.addListener((state) {}))
    //     .thenAnswer((realInvocation) => () {});
    // await app.main();
    // await tester.pumpAndSettle();
    await tester.pumpWidget(ProviderScope(overrides: [
      prefs.overrideWithValue(mockPrefs),
      userProvider.overrideWithValue(mockUserProvider)
    ], child: const MyApp()));

    // The default value is `0`, as declared in our provider
    expect(find.text('Calories Tracker'), findsOneWidget);
  });
}
