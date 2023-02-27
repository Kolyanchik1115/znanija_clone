import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

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
          Container(color: Colors.redAccent),
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
