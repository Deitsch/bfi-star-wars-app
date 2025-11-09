import 'package:flutter/material.dart';
import 'package:star_wars_app/home_page.dart';
import 'package:star_wars_app/planet_page.dart';
import 'package:star_wars_app/tab.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: [HomePage(), PlanetPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: NavTab.values.map((tab) {
          return BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.name);
        }).toList(),
      ),
    );
  }
}
