import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:znanija_clone/pages/auth/login_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset('assets/rive/start.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get knowledge    & earn",
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Poppins",
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Expanded(child: Divider(color: Colors.black)),
                      SizedBox(width: 20),
                      Text(
                        "How does it work?",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Divider(color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const WelcomeWidget(),
                  const Spacer(flex: 2),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 149, 68, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          showGeneralDialog(
                            barrierDismissible: true,
                            barrierLabel: 'Sign In',
                            context: context,
                            pageBuilder: (_, __, ___) => Container(
                              height: 620,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 120,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 139, 244, 54)),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: Text("See our reward system >> ")),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'ASK QUESTIONS',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 130,
              height: 130,
              child: Image.asset('assets/images/quetion.png'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.asset('assets/images/answer.png'),
            ),
            const Text(
              'GIVE ANSWERS',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'GET REAL MONEY',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 130,
              height: 130,
              child: Image.asset('assets/images/money.png'),
            ),
          ],
        )
      ],
    );
  }
}
