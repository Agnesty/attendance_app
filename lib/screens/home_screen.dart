import 'package:flutter/material.dart';

import 'attendance_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': AttendanceScreen()},
      {'page': HistoryScreen()},
      {'page': ProfileScreen()},
    ];
    super.initState();
  }

  @override
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFF0047CC),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: Image.asset(
              "assets/images/Inactived@3x.png",
              width: 26.4,
              height: 22,
            ),
            activeIcon: Image.asset("assets/images/Active.png"),
          ),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Image.asset("assets/images/InActived.png")),
        ],
      ),
    );
  }
}
