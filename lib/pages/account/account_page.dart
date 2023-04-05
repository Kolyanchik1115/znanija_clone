import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/auth/auth_bloc.dart';

import 'package:znanija_clone/pages/splash/new_user_splash/new_user_splash_page.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account_page';

  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 58, 183, 137),
            centerTitle: true,
            title: const Text(
              'Your personal data',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, letterSpacing: 0.53),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  context.read<AuthBloc>().add(AuthLogoutEvent());
                  Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil(
                    NewUserSplashPage.routeName,
                    (_) => false,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.logout,
                    size: 20,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(110.0),
              child: Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person_outline_rounded),
                        ),
                        Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 0, 255, 162),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.email,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            state.user.role,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: const Center(),
        );
      },
    );
  }
}
