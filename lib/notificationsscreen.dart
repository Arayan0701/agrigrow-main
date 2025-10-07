import 'package:agrigrow/home_screen.dart';
import 'package:agrigrow/product_detail.dart';
import 'package:agrigrow/profilescreen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'avatar': 'assets/images/farmer_1.jpg',
      'title': 'Rajubhai',
      'subtitle': 'With 50% discounts',
      'timestamp': '14:59',
    },
    {
      'avatar': 'assets/images/farmer_2.jpg',
      'title': 'Sureshbhai',
      'subtitle': 'With 50% discounts',
      'timestamp': '11:59',
    },
    {
      'avatar': 'assets/images/farmer_3.png',
      'title': 'Arjanbapa',
      'subtitle': 'With 50% discounts',
      'timestamp': '11:59',
    },
    {
      'avatar': 'assets/images/farmer_4.png',
      'title': 'Mansukhbapa',
      'subtitle': 'With 50% discounts',
      'timestamp': '14:59',
    },
    {
      'avatar': 'assets/images/farmer_5.png',
      'title': 'Jethabhai',
      'subtitle': 'With 50% discounts',
      'timestamp': '11:59',
    },
    {
      'avatar': 'assets/images/farmer_1.jpg',
      'title': 'Kalubhai',
      'subtitle': 'With 50% discounts',
      'timestamp': '11:59',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background Decorative Circles
          Positioned(
            top: -80,
            left: -60,
            child: Container(
              height: 180,
              width: 180,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -40,
            right: -60,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: -40,
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ✅ Main UI
          Column(
            children: [
              // AppBar-like custom top bar
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black),
                      Text(
                        "Notification",
                        style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 18,
                      ),
                    ],
                  ),
                ),
              ),

              // Notification List
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notif = notifications[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(notif['avatar']!),
                            radius: 25,
                          ),
                          title: Text(
                            notif['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            notif['subtitle']!,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[700]),
                          ),
                          trailing: Text(
                            notif['timestamp']!,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[800]),
                          ),
                        ),
                        const Divider(thickness: 0.8),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 2, // Notification tab selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        
        onTap: (index) {
          if (index == 0){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ),
            );
          }
          if (index == 1){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen()
              ),
            );
          }
          if (index == 2){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()
              ),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
