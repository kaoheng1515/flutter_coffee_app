import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white70,
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              'Login',
              style: TextStyle(fontSize: 24),
            ),
            Text(
<<<<<<< HEAD
              'Login to coffee application and order \n         all things who you need !!! ',
=======
              'Login to coffee application and order \n all things who you need !!! ',
              textAlign: TextAlign.center,
>>>>>>> 56a6a6feea96f7904c2dd91bbc3378ce54848263
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Email Field
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Email', style: TextStyle(fontSize: 14)),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'example@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Password Field
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Password', style: TextStyle(fontSize: 14)),
            ),
            TextField(
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Forgot Password & Privacy Policy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Forgot Password', style: TextStyle(fontSize: 14)),
                Text('Privacy Policy', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 20),

            // Register Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 90.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
