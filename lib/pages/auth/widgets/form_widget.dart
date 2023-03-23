import 'package:flutter/material.dart';
import 'package:znanija_clone/config/data_provider.dart';
import 'package:znanija_clone/domain/api_client.dart';
import 'package:znanija_clone/pages/main_page.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final apiClient = ApiClient();
  String? errorText;
  bool isChecked = false;
  bool isNotValidate = false;
  late String myToken;

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        myToken = await apiClient.signIn(
          email: emailController.text,
          password: passwordController.text,
        );
      } catch (e) {
        errorText = ' Неправильный логин или пароль';
      }

      TokenDataProvider().setToken(myToken);

      Navigator.of(context).pushNamedAndRemoveUntil(
        MainPage.routeName,
        (_) => false,
        arguments: myToken,
      );
    } else {
      errorText = 'Заполните логин или пароль';
    }
  }

  @override
  Widget build(BuildContext context) {
    const emailTextFieldDecorator = InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.purple, width: 1.5),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintText: 'Nick or email',
    );
    const passTextFieldDecorator = InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.purple, width: 1.5),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintText: 'Password',
    );
    final errorText = this.errorText;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (errorText != null) ...[
            Text(
              errorText,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
          ],
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
                  onPressed: () => loginUser(),
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
    );
  }
}
