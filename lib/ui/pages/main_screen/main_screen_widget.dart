import 'package:flutter/material.dart';
import 'package:znanija_clone/config/data_provider.dart';
import 'package:znanija_clone/ui/pages/start_screen/start_screen.dart';

class MainScreenWidget extends StatefulWidget {
  final String token;
  const MainScreenWidget({Key? key, required this.token}) : super(key: key);

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartScreen(),
                  ),
                  ModalRoute.withName(''),
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
