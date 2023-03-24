import 'package:flutter/material.dart';
import 'package:znanija_clone/pages/splash/start_splash.dart';
import 'package:znanija_clone/utils/helper.dart';

class SearchPage extends StatelessWidget {
  static const routeName = 'search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () async {
                await deleteToken();
                Navigator.of(context, rootNavigator: true)
                    .pushNamedAndRemoveUntil(
                  SplashPage.routeName,
                  (_) => false,
                );
              },
              child: const Text('')),
        ),
      ),
    );
  }
}
