import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';
import 'package:znanija_clone/pages/splash/new_user_splash/new_user_splash_page.dart';

Future<void> showDialogDeleteAcc(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        content: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Are you sure to logout?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogoutEvent());
                      Navigator.of(context, rootNavigator: true)
                          .pushNamedAndRemoveUntil(
                        NewUserSplashPage.routeName,
                        (_) => false,
                      );
                    },
                    child: Container(
                      width: 124,
                      height: 41,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(51),
                        ),
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 84,
                      height: 41,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(51),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
