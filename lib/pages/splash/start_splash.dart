import 'package:flutter/material.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/pages/splash/wellcome_splash.dart';
import 'package:znanija_clone/utils/helper.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _navigateToPage() async {
    if (await haveToken()) {
      await Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        MainPage.routeName,
        (_) => false,
      );
    } else {
      await Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        NewUserSplash.routeName,
        (_) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await _navigateToPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 103, 205, 210),
            Color.fromARGB(255, 132, 226, 184),
          ], begin: Alignment.bottomRight),
        ),
        child: Center(
          child: Container(
            width: 312,
            height: 66,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: Colors.white,
            ),
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text(
                  'Start Splash',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.greenAccent,
                      letterSpacing: 1.6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
