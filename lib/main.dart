import 'package:flutter/material.dart';
import 'package:znanija_clone/config/data_provider.dart';
import 'package:znanija_clone/pages/main_page.dart';
import 'package:znanija_clone/routes/app_routes.dart';
import 'package:znanija_clone/pages/splash/splash_page.dart';
import 'package:znanija_clone/resources/theme/borders.dart';
import 'package:znanija_clone/utils/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tokenProvider = TokenDataProvider();
  runApp(MyApp(token: await tokenProvider.getToken()));
}

class MyApp extends StatelessWidget {
  final token;

  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGeneratedRoute,
      home: isAuth(token) ? MainPage(token: token) : const SplashPage(),
    );
  }
}
