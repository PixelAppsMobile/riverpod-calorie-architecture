import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page.dart';
import 'package:totaltest/presentation/screens/homepage/home_page.dart';
import 'package:totaltest/presentation/screens/splash/splash_page.dart';

/// This class is a Singleton and handles navigation throughout the app.
///
/// Call init() to initialize the class before calling MaterialApp.router().
class AppRouter {
  static late final AppRouter _instance;

  AppRouter._();

  static AppRouter get instance => _instance;

  static late final GoRouter _router;

  static const String _splashRoute = 'splash';

  static const String _rootRoute = '/';
  static const String _adminRoute = 'admin';
  static const String _detailsRoute = 'details';
  static const String _homeRoute = 'home';
  static const String _loginRoute = 'login';
  static const String _errorRoute = 'error';

  static const String splashRoute = _rootRoute + _splashRoute;

  static const String rootRoute = _rootRoute;
  static const String adminOverviewRoute = _rootRoute + _adminRoute;
  static const String adminDetailsRoute =
      _rootRoute + _adminRoute + _detailsRoute;
  static const String homeRoute = _rootRoute + _homeRoute;
  static const String loginRoute = _rootRoute + _loginRoute;
  static const String errorRoute = _rootRoute + _errorRoute;

  static RouterConfig<Object> get router => _router;

  static void init(WidgetRef ref) {
    _router = GoRouter(
      initialLocation: splashRoute,
      redirect: (context, state) {
        if (state.location == splashRoute) return null;

        AsyncValue<AppUser?> userAsyncValue = ref.read(appUserProvider);

        return userAsyncValue.when(
          data: (user) => user != null
              ? user.role == UserRole.admin
                  ? adminOverviewRoute
                  : homeRoute
              : loginRoute,
          error: (error, stackTrace) => errorRoute,
          loading: () => null,
        );
      },
      routes: [
        GoRoute(
          path: _rootRoute,
          builder: (context, state) => const Scaffold(),
          routes: [
            GoRoute(
              path: _splashRoute,
              builder: (context, state) => const SplashPage(),
            ),
            GoRoute(
              path: _loginRoute,
              builder: (context, state) => const AuthPage(),
            ),
            GoRoute(
              path: _homeRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
            ),
            GoRoute(
              path: _adminRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const AdminOverview();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: _detailsRoute,
                  builder: (BuildContext context, GoRouterState state) {
                    return AdminDetailsScreen(
                      uid: state.params['uid']!,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: _errorRoute,
              builder: (BuildContext context, GoRouterState state) {
                return Container();
              },
            ),
          ],
        ),
      ],
    );
  }
}
