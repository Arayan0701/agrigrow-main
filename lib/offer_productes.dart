import 'package:agrigrow/cartpage.dart';
import 'package:flutter/material.dart';

// --- Offer Product Page with Quantity and Add to Cart ---
class OfferProductPage extends StatefulWidget {
  @override
  State<OfferProductPage> createState() => _OfferProductPageState();
}

class _OfferProductPageState extends State<OfferProductPage> {
  int quantity = 1;
  final int pricePerItem = 2060;

  void incrementQuantity() {
    setState(() => quantity++);
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void addToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          quantity: quantity,
          pricePerItem: pricePerItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offer Products"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/agromin_gold.png',
                  height: 120,
                  width: 100,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Aries Agro limited Agromin Gold",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₹ 2060 ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green),
                  ),
                  Text(
                    "₹ 3060",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Save : ₹ 1000",
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Qty: "),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decrementQuantity,
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.green[200],
                    child: Text(
                      quantity.toString().padLeft(2, '0'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: incrementQuantity,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                "Brown the beet beans. Lean ground beef – 1 like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choice of Add On",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(height: 8),
              AddOnList(),
              SizedBox(height: 24),
              ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart, color: Colors.green),
                label: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/CartPage', arguments: {
                    'quantity': quantity,
                    'pricePerItem': pricePerItem,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Cart Page ---

/*class CartPage extends StatelessWidget {
  final int quantity;
  final int pricePerItem;

  CartPage({required this.quantity, required this.pricePerItem});

  @override
  Widget build(BuildContext context) {
    int total = quantity * pricePerItem;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Text(
          "Total: ₹$total for $quantity items",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
*/
// --- AddOnList remains unchanged ---

class AddOnList extends StatefulWidget {
  @override
  _AddOnListState createState() => _AddOnListState();
}

class _AddOnListState extends State<AddOnList> {
  int? _selectedAddOn = 0;

  @override
  Widget build(BuildContext context) {
    final addOns = [
      {"title": "Agri Moss", "price": "₹ 230", "icon": Icons.local_florist},
      {"title": "Agri - Humic Granules", "price": "₹ 170", "icon": Icons.grass},
      {"title": "Agri - Aquagel", "price": "₹ 250", "icon": Icons.water_drop},
    ];

    return Column(
      children: List.generate(addOns.length, (index) {
        final addOn = addOns[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green[50],
            child: Icon(addOn['icon'] as IconData, color: Colors.green),
          ),
          title: Text(addOn['title'] as String),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                addOn['price'] as String,
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Radio<int>(
                value: index,
                groupValue: _selectedAddOn,
                onChanged: (value) {
                  setState(() {
                    _selectedAddOn = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
        );
      }),
    );
  }
}
