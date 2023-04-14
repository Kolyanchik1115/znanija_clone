import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/common/theme/forms.dart';
import 'package:znanija_clone/pages/main_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error) {
            log('Error auth');
          } else if (state.status == AuthStatus.success) {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              MainPage.routeName,
              (_) => false,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: emailTextFieldDecorator,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: passTextFieldDecorator,
              obscureText: true,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthGoogleLoginEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      'Google',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text('Keep me logged in'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
