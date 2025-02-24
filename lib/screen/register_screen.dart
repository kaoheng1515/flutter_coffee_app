import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Register',
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
            SizedBox(height: 30),
            Text(
              'Register your account',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'First Name',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Set the border radius here
                  borderSide:
                      BorderSide(color: Colors.grey), // Optional: border color
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Last Name',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Set the border radius here
                  borderSide:
                      BorderSide(color: Colors.grey), // Optional: border color
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Set the border radius here
                  borderSide:
                      BorderSide(color: Colors.grey), // Optional: border color
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm Password',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: TextButton(onPressed: () {
                      // Handle registration
                    },
                      child: Text('Looks nice'),)
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle registration
              },
              child: Text('Create Account'),
            ),
            SizedBox(height: 80),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                // Handle registration
              },
              child: Text('Already have an account'),
            )
          ],
        ),
      ),
    );
  }
}
