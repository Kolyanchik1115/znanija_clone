import 'dart:ui';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
                    children: const [
                      Expanded(child: Divider(color: Colors.black)),
                      Text(
                        "How does it work?",
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(child: Divider(color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const WelcomeWidget(),
                  const Spacer(flex: 2),
                  Center(
                    child: ConfirmationSlider(
                      text: 'SWIPE TO START',
                      stickToEnd: true,
                      foregroundColor: Colors.black,
                      onConfirmation: () {},
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
