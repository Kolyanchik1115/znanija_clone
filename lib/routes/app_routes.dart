import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:znanija_clone/core/utils/route_animations.dart';
import 'package:znanija_clone/presentation/pages/account/account_page.dart';
import 'package:znanija_clone/presentation/pages/question/full_question.dart';
import 'package:znanija_clone/presentation/pages/question/question_page.dart';
import 'package:znanija_clone/presentation/pages/auth/login_page.dart';
import 'package:znanija_clone/presentation/pages/auth/register_page.dart';
import 'package:znanija_clone/presentation/pages/main_page.dart';
import 'package:znanija_clone/presentation/pages/search/search_page.dart';
import 'package:znanija_clone/presentation/pages/settings/settings_page.dart';
import 'package:znanija_clone/presentation/pages/splash/new_user_splash/new_user_splash_page.dart';
import 'package:znanija_clone/presentation/pages/splash/start_splash/start_splash_page.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();
  static final GoRouter goRouter = GoRouter(
    initialLocation: SplashPage.routeName,
    navigatorKey: navKey,
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
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: QuestionPage.routeName,
                builder: (BuildContext context, GoRouterState state) {
                  return const QuestionPage();
                },
                
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AccountPage.routeName,
                builder: (BuildContext context, GoRouterState state) {
                  return const AccountPage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: navKey,
        path: FullQuestion.routeName,
        pageBuilder: (context, state) =>
            buildSlideTransitionPage(const FullQuestion()),
      ),
      GoRoute(
        parentNavigatorKey: navKey,
        path: SettingsPage.routeName,
        pageBuilder: (context, state) =>
            buildSlideTransitionPage(const SettingsPage()),
      ),
    ],
  );
}
