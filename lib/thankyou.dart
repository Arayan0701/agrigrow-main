import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: 0, left: 0,
            child: CircleAvatar(
              backgroundColor: Colors.orange[800],
              radius: 50,
            ),
          ),
          Positioned(
            top: 0, right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.green[700],
              radius: 70,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => 
                Navigator.pushNamed(context, '/HomeScreen'),                ),
                SizedBox(height: 30),
                Image.asset('assets/icons/logo.png', width: 90),
                SizedBox(height: 30),
                Text(
                  'Agri Tech',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.green),
                ),
                SizedBox(height: 20),
                Text(
                  'Thanks To Asking Your Question\nOur Expert Will Reach Out Soon',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                // Navigation bar mock
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
