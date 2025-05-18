import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/screen/favorite_screen.dart';
import 'package:flutter_coffee_app/screen/home_page_screen.dart';
import 'package:flutter_coffee_app/screen/profile_screen.dart';

import 'menu_screen.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    HomePageScreen(),
    MenuScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  _onItemTaped(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green, // Active item color
        unselectedItemColor: Colors.grey, // Inactive item color
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTaped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.green : Colors.grey, // Dynamic color based on selection
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(
                Icons.menu,
                color: currentIndex == 1 ? Colors.green : Colors.grey,
              ),
            ),
            label: 'Menu',
          ),


          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: currentIndex == 2 ? Colors.green : Colors.grey,
            ),
            label: 'Favorite',
          ),


          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2,
              color: currentIndex == 3 ? Colors.green : Colors.grey, // Dynamic color based on selection
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
