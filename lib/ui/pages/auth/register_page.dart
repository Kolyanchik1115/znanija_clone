import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:znanija_clone/domain/api_client.dart';
import 'package:znanija_clone/config/data_provider.dart';
import 'package:znanija_clone/ui/pages/main_screen/main_screen_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  final apiClient = ApiClient();

  bool _isNotValidate = false;
  late String myToken;

  void registerUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        roleController.text.isNotEmpty) {
      // var regBody = {
      //   "email": emailController.text,
      //   "password": passwordController.text,
      //   "role": roleController.text
      // };
      // var response = await http.post(Uri.parse(registration),
      //     headers: {"Content-Type": "application/json"},
      //     body: jsonEncode(regBody));
      // var jsonResponse = jsonDecode(response.body);
      // var token = jsonResponse['token'];

      try {
        myToken = await apiClient.signUp(
          email: emailController.text,
          password: passwordController.text,
          role: roleController.text,
        );
      } catch (_) {}

      TokenDataProvider().setToken(myToken);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreenWidget(token: myToken)));
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: const TextStyle(color: Colors.white),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      hintText: "Email",
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: const TextStyle(color: Colors.white),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      hintText: "Password",
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
                TextField(
                  controller: roleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: const TextStyle(color: Colors.white),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      hintText: "Role",
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
                ElevatedButton(
                    onPressed: () => registerUser(),
                    child: Container(
                      color: Colors.red,
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
