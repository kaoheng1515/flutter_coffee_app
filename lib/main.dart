import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/screen/login_screen.dart';
import 'package:flutter_coffee_app/screen/register_screen.dart';
import 'package:flutter_coffee_app/screen/welcome_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}