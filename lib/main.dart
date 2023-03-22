import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:znanija_clone/ui/pages/main_screen/main_screen_widget.dart';
import 'package:znanija_clone/ui/pages/start_screen/start_screen.dart';
import 'package:znanija_clone/ui/theme/borders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: prefs.getString('token'),
  ));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEEF1F8),
          primarySwatch: Colors.blue,
          fontFamily: "Intel",
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(height: 0),
            border: AppInputBorder.defaultInputBorder,
            enabledBorder: AppInputBorder.defaultInputBorder,
            focusedBorder: AppInputBorder.defaultInputBorder,
            errorBorder: AppInputBorder.defaultInputBorder,
          ),
        ),
        home: token != null && JwtDecoder.isExpired(token) == false
            ? MainScreenWidget(token: token)
            : const StartScreen());
  }
}
