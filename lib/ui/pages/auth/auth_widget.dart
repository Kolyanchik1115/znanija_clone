import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:znanija_clone/config/config.dart';
import 'package:znanija_clone/ui/pages/auth/register_page.dart';
import 'package:znanija_clone/ui/pages/main_screen/main_screen_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
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

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorText;
  bool isChecked = false;
  bool isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);
      var myToken = jsonResponse['token'];
      prefs.setString('token', myToken);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreenWidget(token: myToken)));
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
