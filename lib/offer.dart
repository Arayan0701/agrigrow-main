import 'package:flutter/material.dart';

class OfferProduct extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Organic Tomato Seeds',
      price: 350.00,
      oldPrice: 500.00,
      save: 150.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.2,
      reviews: 89,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      name: 'Aries Agro Limited Agromin Gold',
      price: 2060.00,
      oldPrice: 3060.00,
      save: 1000.00,
      imageUrl: 'https://via.placeholder.com/150',
      badgeUrl: 'https://via.placeholder.com/32',
      rating: 4.5,
      reviews: 128,
    ),
    
    // Add more diverse products if needed
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // AppBar replacement
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
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
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/40'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Header section
                  Text('Best Deal',
                      style: TextStyle(fontSize: 25, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text('Offer Products',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All',
                            style: TextStyle(color: Colors.green[800])),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('80 types of seeds available',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  SizedBox(height: 16),
                  // Products grid
                  Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), 
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none), 
            label: 'Notifications'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), 
            label: 'Profile'
          ),
        ],
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
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
  final String badgeUrl;
  final double rating;
  final int reviews;

  Product({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.save,
    required this.imageUrl,
    required this.badgeUrl,
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
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported, size: 50);
                    },
                  ),
                ),
                SizedBox(height: 8),
                // Product name
                Text(product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87)),
                SizedBox(height: 4),
                // Rating
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 4),
                    Text('${product.rating}',
                        style: TextStyle(fontSize: 12)),
                    SizedBox(width: 4),
                    Text('(${product.reviews})',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 4),
                // Price information
                Text('₹${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800])),
                Row(
                  children: [
                    Text('₹${product.oldPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        )),
                    SizedBox(width: 8),
                    Text('Save ₹${product.save.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 12, 
                            color: Colors.green,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                // Add to cart button
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      padding: EdgeInsets.symmetric(vertical: 4),
                    ),
                    child: Text('Add to Cart', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Image.network(
              product.badgeUrl,
              height: 28,
              width: 28,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}