import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/images.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 500),
            Container(
              width: double.infinity, // Specify width for the container
              height: 410, // Specify height for the container
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.95),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Get your new Coffee experience at',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Coffee App',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Where coffee meets comfort',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                      // Handle login
                    },
                    style: ElevatedButton.styleFrom(
                      // Text color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 80.0), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                      elevation: 5, // Shadow elevation
                    ),
                    child: Text('Get Start'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}