import 'package:agrigrow/notificationsscreen.dart';
import 'package:agrigrow/profilescreen.dart';
import 'package:agrigrow/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:agrigrow/home_screen.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1; // ✅ Cart is selected by default

  final List<Product> products = [
    Product(
      name: 'Aries Agro Limited Agromin',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'assets/icons/welcome.jpg', // ✅ Local asset
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Organic Tomato Seeds',
      price: 350.00,
      oldPrice: 500.00,
      save: 150.00,
      imageUrl: 'assets/icons/welcome.jpg', // ✅ Network
      rating: 4.2,
      reviews: 89,
    ),
    Product(
      name: 'Organic Brinjal Seeds',
      price: 200.00,
      oldPrice: 300.00,
      save: 100.00,
      imageUrl: 'assets/icons/welcome.jpg',
      rating: 4.1,
      reviews: 45,
    ),
    Product(
      name: 'Organic Chilli Seeds',
      price: 400.00,
      oldPrice: 550.00,
      save: 150.00,
      imageUrl: 'assets/icons/welcome.jpg',
      rating: 4.3,
      reviews: 60,
    ),
    Product(
      name: 'Aries Agro Limited Agromin',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'assets/icons/welcome.jpg', // ✅ Local asset
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'assets/icons/welcome.jpg', // ✅ Local asset
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotificationScreen()),
      );
    }
    if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      body: Stack(
        children: [
          // Background Circles
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

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar replacement
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      Text(
                        'AgriTech',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/40'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Header Section
                  Text('Our',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('Best Products',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All',
                            style: TextStyle(color: Colors.green[800])),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('80 types of seeds available',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey[700])),
                  const SizedBox(height: 16),
                  // Products Grid
                  Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

// ✅ Product Model
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

// ✅ Product Card
class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Check asset or network image
            Center(
              child: product.imageUrl.startsWith('http')
                  ? Image.network(
                      product.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      product.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
            ),
            const SizedBox(height: 8),
            // Product Name
            Text(product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87)),
            const SizedBox(height: 4),
            // Rating
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 4),
                Text('${product.rating}',
                    style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 4),
                Text('(${product.reviews})',
                    style:
                        const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 4),
            // Price Information
            Text('₹${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800])),
            Row(
              children: [
                Text('₹${product.oldPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    )),
                const SizedBox(width: 8),
                Text('Save ₹${product.save.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle add to cart action
                  Navigator.pushNamed(context, '/OfferProductPage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  padding: const EdgeInsets.symmetric(vertical: 1),
                ),
                child: const Text('Add to Cart',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
