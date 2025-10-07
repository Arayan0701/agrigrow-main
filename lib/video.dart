import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  final List<String> categories = [
    'Traditional Farming', 'Hydroponics',
    'Traditional Farming', 'Hydroponics',
    'Hydroponics', 'Traditional Farming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                Chip(label: Text('Farming')),
                Chip(label: Text('Precision farming')),
                Chip(label: Text('Hydroponics')),
                Chip(label: Text('Techniques')),
                Chip(label: Text('Modern Farming Techniques')),
              ],
            ),
            SizedBox(height: 18),
            Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: categories.map((cat) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          cat == 'Hydroponics'
                            ? 'assets/hydroponics.jpg'
                            : 'assets/traditional.jpg',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      cat,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
