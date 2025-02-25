import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/screen/payment.dart';

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
      home: Payment(), // Ensure Payment() is a valid widget
    );
  }
}