import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:znanija_clone/core/enums/theme_type.dart';
import 'package:znanija_clone/core/resources/app_themes.dart';
import 'package:znanija_clone/presentation/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/presentation/blocs/settings/settings_bloc.dart';
import 'package:znanija_clone/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthCheckUserExist()),
      child: BlocProvider(
        create: (context) => SettingsBloc()..add(ThemeCheckExist()),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: state.theme == AppTheme.lightTheme
                  ? AppThemeData.lightTheme
                  : AppThemeData.darkTheme,
              routerConfig: AppRouter.goRouter,
            );
          },
        ),
      ),
    );
  }
}
