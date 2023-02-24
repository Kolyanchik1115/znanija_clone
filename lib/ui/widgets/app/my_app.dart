import 'package:flutter/material.dart';
import 'package:znanija_clone/ui/theme/borders.dart';
import 'package:znanija_clone/ui/widgets/start_screen/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const StartScreen(),
    );
  }
}