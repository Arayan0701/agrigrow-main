import 'package:agrigrow/deliveryaddress.dart';
import 'package:agrigrow/profilescreen.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Header section with user info
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.agriculture,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Agri Grow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'agrigroup@gmail.com',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu items
            _buildMenuItem(
              icon: Icons.shopping_bag,
              title: 'My Orders',
              onTap: () {
                Navigator.pop(context); // Close drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('My Orders clicked')),
                );
              },
            ),
            
            _buildMenuItem(
              icon: Icons.person,
              title: 'My Profile',
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            
            _buildMenuItem(
              icon: Icons.location_on,
              title: 'Delivery Address',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryAddressPage()),
                ); // Close drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Delivery Address clicked')),
                );
              },
            ),
            
            _buildMenuItem(
              icon: Icons.payment,
              title: 'Payment Methods',
              onTap: () {
                Navigator.pop(context); // Close drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment Methods clicked')),
                );
              },
            ),
            
            _buildMenuItem(
              icon: Icons.contact_support,
              title: 'Contact Us',
              onTap: () {
                Navigator.pop(context); // Close drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Contact Us clicked')),
                );
              },
            ),
            
            Divider(height: 20, thickness: 1),
            
            // Logout button
            _buildMenuItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                Navigator.pop(context); // Close drawer
                _showLogoutDialog(context);
              },
              color: Colors.red,
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Log Out', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logged out successfully')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

