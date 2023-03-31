import 'package:flutter/material.dart';
import 'package:znanija_clone/pages/account/account_page.dart';
import 'package:znanija_clone/pages/answer/answer_page.dart';
import 'package:znanija_clone/pages/auth/login_page.dart';
import 'package:znanija_clone/pages/auth/register_page.dart';
import 'package:znanija_clone/pages/search/search_page.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/pages/splash/wellcome_splash.dart';
import 'package:znanija_clone/pages/splash/start_splash.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    WidgetBuilder builder;
    // final arguments = settings.arguments;

    switch (settings.name) {
      case SplashPage.routeName:
        builder = (_) => const SplashPage();
        break;
      case NewUserSplash.routeName:
        builder = (_) => const NewUserSplash();
        break;
      case LoginPage.routeName:
        builder = (_) => const LoginPage();
        break;
      case RegistrationPage.routeName:
        builder = (_) => const RegistrationPage();
        break;
      case MainPage.routeName:
        builder = (_) => MainPage();
        break;
      case SearchPage.routeName:
        builder = (_) => const SearchPage();
        break;
      case AccountPage.routeName:
        builder = (_) => const AccountPage();
        break;
      case AnswerPage.routeName:
        builder = (_) => const AnswerPage();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
