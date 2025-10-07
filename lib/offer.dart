import 'package:agrigrow/home_screen.dart';
import 'package:agrigrow/notificationsscreen.dart';
import 'package:agrigrow/profilescreen.dart';
import 'package:flutter/material.dart';

class OfferProductsScreen extends StatefulWidget {
  const OfferProductsScreen({Key? key}) : super(key: key);

  @override
  State<OfferProductsScreen> createState() => _OfferProductsScreenState();
}

class _OfferProductsScreenState extends State<OfferProductsScreen> {
  int _selectedIndex = 1;

  final List<Product> products = [
    Product(
      name: 'Aries Agro Limited Agromin',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'assets/images/home_2.jpg',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Organic Tomato Seeds',
      price: 350.00,
      oldPrice: 500.00,
      save: 150.00,
      imageUrl: 'assets/images/home_3.jpg',
      rating: 4.2,
      reviews: 89,
    ),
    Product(
      name: 'Hybrid Wheat Seeds',
      price: 780.00,
      oldPrice: 1000.00,
      save: 220.00,
      imageUrl: 'assets/images/home_3.jpg',
      rating: 4.4,
      reviews: 64,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'assets/images/home_3.jpg',
      rating: 4.5,
      reviews: 128,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
     
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  NotificationScreen()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background decorative circles
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
            top: -50,
            left: 80,
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black),
                        onPressed: () {},
                      ),
                      Text(
                        'AgriGrow',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/40'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Best Deal',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Offer Products',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.green[800]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '80 types of seeds available',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),
                  // Product grid
                  Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


class Product {
  final String name;
  final double price;
  final double oldPrice;
  final double save;
  final String imageUrl;
  final double rating;
  final int reviews;

  Product({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.save,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.imageUrl, 
                    height: 60,
                    width: 100,
                    fit: BoxFit.contain,

                  ),
                ),
                SizedBox(height: 8),
                // Product name
                Text(product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 9,
                        color: Colors.black87)),
                SizedBox(height: 4),
                // Rating
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 4),
                    Text('${product.rating}',
                        style: TextStyle(fontSize: 9)),
                    SizedBox(width: 4),
                    Text('(${product.reviews})',
                        style: TextStyle(fontSize: 9, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 1),
                // Price information
                Text('₹${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 8, 
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800])),
                Row(
                  children: [
                    Text('₹${product.oldPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 8,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        )),
                    SizedBox(width: 8),
                    Text('Save ₹${product.save.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 7, 
                            color: Colors.green,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                // Add to cart button
                SizedBox(height: 1),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      padding: EdgeInsets.symmetric(vertical: 4),
                    ),
                    child: Text('Add to Cart', style: TextStyle(fontSize: 7, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}