import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:znanija_clone/pages/account/account_page.dart';
import 'package:znanija_clone/pages/answer/answer_page.dart';
import 'package:znanija_clone/pages/auth/login_page.dart';
import 'package:znanija_clone/pages/auth/register_page.dart';
import 'package:znanija_clone/pages/search/search_page.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/pages/settings/settings_page.dart';
import 'package:znanija_clone/pages/splash/new_user_splash/new_user_splash_page.dart';
import 'package:znanija_clone/pages/splash/start_splash/start_splash_page.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case SplashPage.routeName:
        builder = (_) => const SplashPage();
        break;
      case NewUserSplashPage.routeName:
        builder = (_) => const NewUserSplashPage();
        break;
      case LoginPage.routeName:
        builder = (_) => const LoginPage();
        break;
      case RegistrationPage.routeName:
        return PageTransition(
          child: const RegistrationPage(),
          type: PageTransitionType.fade,
        );
      case MainPage.routeName:
        return PageTransition(
          child: MainPage(),
          type: PageTransitionType.fade,
        );
      case SearchPage.routeName:
        return PageTransition(
          child: const SearchPage(),
          type: PageTransitionType.fade,
        );
      case AccountPage.routeName:
        return PageTransition(
          child: const AccountPage(),
          type: PageTransitionType.fade,
        );
      case AnswerPage.routeName:
        return PageTransition(
          child: const AnswerPage(),
          type: PageTransitionType.fade,
        );
      case SettingsPage.routeName:
        return PageTransition(
          child: const SettingsPage(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 250),
          reverseDuration: const Duration(milliseconds: 250),
        );

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
