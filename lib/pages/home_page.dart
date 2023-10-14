import 'package:flutter/material.dart';
import 'package:ya_parkuyuc/pages/info_page.dart';
import 'package:ya_parkuyuc/pages/map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MapPage(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        iconSize: 30,
        currentIndex: 0,
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const InfoPage(),
            ));
          }
        },
        items: _pageItems,
      ),
    );
  }
}

const _pageItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.map_outlined),
    label: 'Карта',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_outline),
    label: 'Информация',
  ),
];
