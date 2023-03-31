import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/pages/auth/widgets/register_form.dart';

class RegistrationPage extends StatelessWidget {
  static const routeName = '/register_page';

  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              const Spacer(flex: 1),
              const Text(
                "Let's introduce ourselves",
                style: TextStyle(fontSize: 27, fontFamily: "Poppins"),
              ),
              const Spacer(flex: 1),
              BlocProvider(
                create: (context) => AuthBloc(),
                child: const RegistrationForm(),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
