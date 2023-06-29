import 'package:flutter/material.dart';

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
