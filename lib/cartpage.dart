import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final int quantity;
  final int pricePerItem;

  CartPage({required this.quantity, required this.pricePerItem});
  @override
  _CartPageState createState() => _CartPageState();
}

class CartItem {
  final String image;
  final String title;
  final String company;
  final int price;
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.company,
    required this.price,
    this.quantity = 2,
  });
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      image: 'assets/agri_protex.png',
      title: 'Agri - Protex',
      company: 'Corp Production',
      price: 2060,
      quantity: 2,
    ),
    CartItem(
      image: 'assets/agri_moss.png',
      title: 'Agri - Moss',
      company: 'Corp Production',
      price: 230,
      quantity: 2,
    ),
  ];

  int taxFees = 200;
  int delivery = 100;
  String promoCode = '';
  bool promoApplied = false;

  int get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get total => subtotal + taxFees + delivery;

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void applyPromo() {
    // Add your promo logic here if needed
    setState(() {
      promoApplied = true;
      // For example, reduce total by Rs.100
      // taxFees -= 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), backgroundColor: Colors.white, elevation: 0, foregroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Row(
                      children: [
                        Image.asset(item.image, width: 60, height: 60),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(item.company, style: TextStyle(color: Colors.green, fontSize: 13)),
                              SizedBox(height: 2),
                              Text('Rs.${item.price}', style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () => decrementQuantity(index),
                        ),
                        Text(item.quantity.toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: 18)),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline, color: Colors.green),
                          onPressed: () => incrementQuantity(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () => removeItem(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Promo Code",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                    ),
                    onChanged: (val) => promoCode = val,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: applyPromo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text('Apply',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            SizedBox(height: 14),
            _cartSummary("Subtotal", "Rs. ${subtotal}"),
            _cartSummary("Tax & Fees", "Rs. ${taxFees}"),
            _cartSummary("Delivery", "Rs. ${delivery}"),
            Divider(thickness: 1),
            _cartSummary("Total", "Rs. ${total}", isBold: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                "BUY NOW",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _cartSummary(String label, String value, {bool isBold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 16)),
            Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 16)),
          ],
        ),
      );

  Widget _buildBottomNavBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.green), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: Colors.green), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none, color: Colors.green), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.green), label: 'Profile'),
        ],
      );
}
