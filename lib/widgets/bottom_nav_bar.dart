import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Add padding
      decoration: BoxDecoration(
        color: Colors.white, // Set background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Soft shadow effect
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green, // Active item color
        unselectedItemColor: Colors.grey, // Inactive item color
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
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
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
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
        onTap: (index) {
          // Handle navigation logic
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/menu');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/favorite');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
