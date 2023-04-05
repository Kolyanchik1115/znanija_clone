import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/blocs/settings/settings_bloc.dart';
import 'package:znanija_clone/common/theme/borders.dart';
import 'package:znanija_clone/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthCheckUserExist()),
      child: BlocProvider(
        create: (context) => SettingsBloc(),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appThemeData[state.theme],
              onGenerateRoute: AppRouter.onGeneratedRoute,
            );
          },
        ),
      ),
    );
  }
}
