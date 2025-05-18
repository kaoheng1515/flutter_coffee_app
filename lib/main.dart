import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/screen/bottom_navigation_bar_app.dart';
import 'package:flutter_coffee_app/screen/favorite_screen.dart';
import 'package:flutter_coffee_app/screen/menu_screen.dart';
import 'package:flutter_coffee_app/screen/profile_screen.dart';
import 'package:flutter_coffee_app/screen/welcome_screen.dart';
import 'package:flutter_coffee_app/screen/login_screen.dart';
import 'package:flutter_coffee_app/screen/register_screen.dart';
import 'package:flutter_coffee_app/screen/home_page_screen.dart';
import 'package:flutter_coffee_app/screen/product_detial_screen.dart';
import 'payment_screen/payment.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => BottomNavigationBarApp(),
        '/product_detail': (context) => ProductDetailScreen(),
        '/payment': (context) => Payment(),
        '/menu': (context)  => MenuScreen(),
        '/favorite': (context)  => FavoriteScreen(),
        '/profile': (context) =>  ProfileScreen(),
        '/logout': (context) => LoginScreen(),
      },
    );
  }
}