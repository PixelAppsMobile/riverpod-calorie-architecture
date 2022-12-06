import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/res/routes/router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    AppRouter.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Calories Tracker',
      routerConfig: AppRouter.router,
    );
  }
}
