import 'package:flutter/material.dart';

import 'package:znanija_clone/presentation/pages/auth/widgets/register_form.dart';

class RegistrationPage extends StatelessWidget {
  static const routeName = '/registerpage';

  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: const [
              Spacer(flex: 1),
              Text(
                "Let's introduce ourselves",
                style: TextStyle(fontSize: 27, fontFamily: "Poppins"),
              ),
              Spacer(flex: 1),
              RegistrationForm(),
              Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
