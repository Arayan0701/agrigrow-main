import 'package:agrigrow/notificationsscreen.dart';
import 'package:agrigrow/product_detail.dart';
import 'package:agrigrow/profilescreen.dart';
import 'package:agrigrow/sidemenu.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> recommendedProducts = [
    {
      "name": "Cholorpyrifos 20% EC",
      "image": "assets/images/home_2.jpg",
      "price": "₹180",
      "oldPrice": "₹278",
      "rating": "4.5",
      "reviews": "128"
    },
    {
      "name": "Soloman 25% EC",
      "image": "assets/images/home_3.jpg",
      "price": "₹300",
      "oldPrice": "₹345",
      "rating": "4.2",
      "reviews": "89"
    },
    {
      "name": "Cholorpyrifos 20% EC",
      "image": "assets/images/home_2.jpg",
      "price": "₹180",
      "oldPrice": "₹278",
      "rating": "4.8",
      "reviews": "54"
    },
    {
      "name": "Soloman 25% EC",
      "image": "assets/images/home_3.jpg",
      "price": "₹300",
      "oldPrice": "₹345",
      "rating": "4.6",
      "reviews": "67"
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.play_circle_fill, "label": "Videos"},
    {"icon": Icons.location_on, "label": "Address"},
    {"icon": Icons.local_offer, "label": "Best Offers"},
    {"icon": Icons.grass, "label": "Soil Testing"},
    {"icon": Icons.star_rate, "label": "Rate Us"},
    {"icon": Icons.person, "label": "Expert"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: SideMenu(),
      body: Stack(
        children: [
          // Decorative background circles
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
          Positioned(
            top: 50,
            right: 15,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 220, 202, 237),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  // AppBar replacement with menu + title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      const Text(
                        "AgriTech",
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 129, 47),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      
                      
                      const SizedBox(width: 10), // keep title centered
                    ],
                  ),
                  const SizedBox(height: 20),

                  // SALE Banner
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'SALE',
                          style: TextStyle(
                          
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            
                            color: Color.fromARGB(255, 216, 119, 7),
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: Colors.black26,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          color: Colors.orange[100],
                          child: const Text(
                            'UPTO 70%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Categories Label
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),

                  // Categories Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(category["icon"],
                                  size: 40, color: Colors.green),
                              const SizedBox(height: 8),
                              Text(
                                category["label"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Recommended Label
                  const Text(
                    "Recommended for you",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Horizontal product list
                  SizedBox(
                    height: 310,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedProducts.length,
                      itemBuilder: (context, index) {
                        final product = recommendedProducts[index];
                        return ProductCard(product: product);
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
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
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

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(right: 15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Image
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Icon(Icons.grass ,
                    size: 50, color: const Color.fromARGB(255, 172, 0, 0)),
              ),
              const SizedBox(height: 8),

              // Product name
              Text(
                product["name"] ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),

              // Rating
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    product["rating"] ?? "4.5",
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(${product["reviews"] ?? "0"})',
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Price information
              Text(
                product["price"] ?? "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              Row(
                children: [
                  Text(
                    product["oldPrice"] ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (product["oldPrice"] != null &&
                      product["price"] != null)
                    Text(
                      _getSaveText(
                          product["oldPrice"]!, product["price"]!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Add to Cart button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    padding:
                        const EdgeInsets.symmetric(vertical: 4),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to calculate savings
  static String _getSaveText(String oldPrice, String price) {
    final old =
        int.tryParse(RegExp(r'\d+').stringMatch(oldPrice) ?? "0") ?? 0;
    final now =
        int.tryParse(RegExp(r'\d+').stringMatch(price) ?? "0") ?? 0;
    if (old > now) {
      return "Save ₹${old - now}";
    }
    return "";
  }
}
