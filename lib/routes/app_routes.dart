import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:znanija_clone/pages/account/account_page.dart';
import 'package:znanija_clone/pages/answer/answer_page.dart';
import 'package:znanija_clone/pages/auth/login_page.dart';
import 'package:znanija_clone/pages/auth/register_page.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/pages/search/search_page.dart';
import 'package:znanija_clone/pages/settings/settings_page.dart';
import 'package:znanija_clone/pages/splash/new_user_splash/new_user_splash_page.dart';
import 'package:znanija_clone/pages/splash/start_splash/start_splash_page.dart';

class AppRouter {
  final navigationKey = GlobalKey<NavigatorState>();

  static final GoRouter goRouter = GoRouter(
    initialLocation: SplashPage.routeName,
    routes: <RouteBase>[
      GoRoute(
        path: SplashPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashPage(),
      ),
      GoRoute(
        path: NewUserSplashPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const NewUserSplashPage(),
      ),
      GoRoute(
        path: LoginPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: RegistrationPage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const RegistrationPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell shell) {
          return MainPage(statefulNavigationShell: shell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: SearchPage.routeName,
                  builder: (BuildContext context, GoRouterState state) {
                    return const SearchPage();
                  }),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: AnswerPage.routeName,
                  builder: (BuildContext context, GoRouterState state) {
                    return const AnswerPage();
                  }),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AccountPage.routeName,
                builder: (BuildContext context, GoRouterState state) {
                  return const AccountPage();
                },
                routes: [
                  GoRoute(
                    path: SettingsPage.routeName,
                    builder: (BuildContext context, GoRouterState state) {
                      return const SettingsPage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
