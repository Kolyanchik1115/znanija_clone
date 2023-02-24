import 'package:flutter/material.dart';
import 'package:znanija_clone/ui/widgets/main_screen/main_screen_widget.dart';

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
                    onTap: () {},
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
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;
  bool isChecked = false;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreenWidget(),
        ),
      );
    } else {
      errorText = 'Не верный логин или пароль';
    }
    setState(() {});
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
            controller: _loginTextController,
            decoration: emailTextFieldDecorator,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordTextController,
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
                  onPressed: _auth,
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
              InkWell(
                onTap: () {},
                child: const Text('Forgot password?'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
