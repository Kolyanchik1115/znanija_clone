import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/pages/splash/wellcome_splash.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.gotUser) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              MainPage.routeName,
              (_) => false,
            );
          });
        } else if (state.status == AuthStatus.noUser) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              NewUserSplash.routeName,
              (_) => false,
            );
          });
        }
      },
      child: Material(
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
      ),
    );
  }
}
