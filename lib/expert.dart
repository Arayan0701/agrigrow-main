import 'package:flutter/material.dart';

class ExpertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/home_2.jpg', width: 50),
                  Image.asset('assets/images/home_3.jpg', width: 50),
                  Image.asset('assets/images/home_2.jpg', width: 50),
                ],
              ),
            ),
            SizedBox(height: 10),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/farmer_3.png'),
              radius: 40,
            ),
            SizedBox(height: 10),
            Text(
              'Agri Tech\nwww.agritech.in',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14),
            Text('Send Your Doubt Here\nWe will get back to you'),
            SizedBox(height: 14),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write review',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              ),
              onPressed: () {},
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
