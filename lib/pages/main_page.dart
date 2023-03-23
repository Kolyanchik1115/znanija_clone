import 'package:flutter/material.dart';
import 'package:znanija_clone/config/data_provider.dart';
import 'package:znanija_clone/pages/splash/splash_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main_page';
  final String token;
  const MainPage({Key? key, required this.token}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Container(
            color: Colors.greenAccent,
            child: ElevatedButton(
              onPressed: () async {
                TokenDataProvider().deleteToken();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SplashPage.routeName,
                  (_) => false,
                );
              },
              child: const Text(''),
            ),
          ),
          Container(color: Colors.greenAccent),
          Container(color: Colors.blueAccent),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
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
        onTap: onSelectTab,
      ),
    );
  }
}
