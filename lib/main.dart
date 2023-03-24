import 'package:flutter/material.dart';
import 'package:znanija_clone/routes/app_routes.dart';

import 'package:znanija_clone/resources/theme/borders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGeneratedRoute,
    );
  }
}
