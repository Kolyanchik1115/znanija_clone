import 'package:flutter/material.dart';
import 'package:znanija_clone/pages/auth/login_page.dart';
import 'package:znanija_clone/pages/auth/register_page.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/pages/splash/splash_page.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    WidgetBuilder builder;
    final arguments = settings.arguments;

    switch (settings.name) {
      case SplashPage.routeName:
        builder = (_) => const SplashPage();
        break;
      case LoginPage.routeName:
        builder = (_) => const LoginPage();
        break;
      case RegisterPage.routeName:
        builder = (_) => RegisterPage();
        break;
      case MainPage.routeName:
        builder = (_) => MainPage(token: arguments as String);
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
