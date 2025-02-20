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
              'Login to Coffee Application',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Login to coffee application and order \n all things who you need !!! ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft, // Aligns the text to the left
              child: Text(
                'Email',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'example@gmail.com',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Set the border radius here
                  borderSide:
                      BorderSide(color: Colors.grey), // Optional: border color
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login
              },
              style: ElevatedButton.styleFrom(
                // Text color
                padding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 100.0), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                elevation: 5, // Shadow elevation
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
                // Handle login
              },
              style: ElevatedButton.styleFrom(
                // Text color
                padding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 90.0), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                elevation: 5, // Shadow elevation
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
