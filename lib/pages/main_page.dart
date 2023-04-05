import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/navigation/navigation_bloc.dart';
import 'package:znanija_clone/blocs/settings/settings_bloc.dart';
import 'package:znanija_clone/pages/account/account_page.dart';
import 'package:znanija_clone/pages/answer/answer_page.dart';
import 'package:znanija_clone/pages/search/search_page.dart';
import 'package:znanija_clone/routes/app_routes.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  static const routeName = '/main_page';
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static const List<String> _pages = [
    SearchPage.routeName,
    AnswerPage.routeName,
    AccountPage.routeName,
  ];

  void _onSelectMenu(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _key.currentState?.openDrawer();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) async {
          if (state.status == NavigationStatus.menu) {
            _onSelectMenu(state.route);
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            key: _key,
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Learn',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.question_answer),
                    label: 'Answer',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined),
                    label: 'Account',
                  ),
                ],
                onTap: (index) {
                  context.read<NavigationBloc>().add(
                        NavigateMenu(
                          route: _pages[index],
                          menuIndex: index,
                        ),
                      );
                }),
            body: Navigator(
              key: _navigatorKey,
              initialRoute: SearchPage.routeName,
              onGenerateRoute: AppRouter.onGeneratedRoute,
            ),
          );
        },
      ),
    );
  }
}
