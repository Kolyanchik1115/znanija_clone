import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:znanija_clone/presentation/blocs/auth/auth_bloc.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account';

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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(110.0),
              child: Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Stack(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          foregroundColor: Color.fromARGB(255, 58, 183, 137),
                          child: Icon(Icons.person_outline_rounded),
                        ),
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
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                CustomListTile(
                  title: 'Notification',
                  onTap: () {},
                  icon: const Icon(Icons.notifications),
                ),
                CustomListTile(
                  title: 'My asnwers',
                  onTap: () {},
                  icon: const Icon(Icons.message),
                ),
                CustomListTile(
                  title: 'My quetions',
                  onTap: () {},
                  icon: const Icon(Icons.question_mark),
                ),
                CustomListTile(
                  title: 'Saved answers',
                  onTap: () {},
                  icon: const Icon(Icons.star),
                ),
                CustomListTile(
                  title: 'Settings',
                  onTap: () => context.go('/account/settings'),
                  icon: const Icon(Icons.settings),
                ),
              ],
            ).toList(),
          ),
        );
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon icon;
  const CustomListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }
}
