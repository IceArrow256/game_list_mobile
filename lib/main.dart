import 'package:flutter/material.dart';

import 'package:game_list/themes/dark_theme.dart';
import 'package:game_list/themes/light_theme.dart';

import 'package:game_list/tabs/tabs.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool _isDarkTheme;

  final tabsTitle = [
    'Game List',
    'Search',
    'Games',
    'Settings',
  ];

  _updateIsDarkTheme(bool value) {
    setState(() {
      _isDarkTheme = value;
    });
  }

  @override
  void initState() {
    _isDarkTheme = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeTab(),
      SearchTab(),
      GamesTab(),
      SettingsTab(
          isDarkTheme: _isDarkTheme,
          updateIsDarkTheme: _updateIsDarkTheme) // Settings tab
    ];

    return MaterialApp(
      title: 'Game List',
      theme: _isDarkTheme ? darkTheme : lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.gamepad),
          title: Text(tabsTitle[_currentIndex]),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 32,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Games'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}