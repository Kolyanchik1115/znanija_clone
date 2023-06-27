import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:znanija_clone/blocs/category/category_bloc.dart';
import 'package:znanija_clone/blocs/questions/quetions_bloc.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/mainpage';

  const MainPage({super.key, required this.statefulNavigationShell});
  final StatefulNavigationShell statefulNavigationShell;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()..add(FetchCategories()),
        ),
        BlocProvider(
          create: (context) => QuestionsBloc()..add(const FetchQuestions()),
        ),
      ],
      child: Scaffold(
        body: statefulNavigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: statefulNavigationShell.currentIndex,
          onTap: (index) {
            statefulNavigationShell.goBranch(index);
          },
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
        ),
      ),
    );
  }
}
