import 'package:flutter/material.dart';

import 'package:znanija_clone/pages/auth/register_page.dart';
import 'package:znanija_clone/pages/auth/widgets/form_widget.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login_page';

  const LoginPage({super.key});

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
                "You are welcome",
                style: TextStyle(fontSize: 27, fontFamily: "Poppins"),
              ),
              const Spacer(flex: 1),
              const FormWidget(),
              const Spacer(flex: 1),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "Sign up with Facebook, Apple or Google",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                      padding: const EdgeInsets.only(top: 2),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.g_mobiledata,
                        size: 45,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.apple,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?   "),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RegisterPage.routeName,
                        (_) => true,
                      );
                    },
                    child: const Text(
                      'Sign up',
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
