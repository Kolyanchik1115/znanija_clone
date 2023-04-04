import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/resources/theme/forms.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
          const SizedBox(height: 20),
          TextField(
            controller: roleController,
            decoration: roleTextFieldDecorator,
          ),
          const SizedBox(height: 50),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthRegistrationEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              role: roleController.text,
                            ));
                        Navigator.of(context, rootNavigator: true)
                            .pushNamedAndRemoveUntil(
                          MainPage.routeName,
                          (_) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
