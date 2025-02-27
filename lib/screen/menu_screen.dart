import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/screen/payment_screen.dart';
import 'package:flutter_coffee_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_coffee_app/screens/payment_screen.dart'; // Import Payment Screen

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Cappuccino',
      'description': 'Bursting blueberry',
      'price': 3.00, // Use double for calculations
      'image': 'assets/images/cappuccino.png',
      'count': 0,
    },
    {
      'name': 'Strawberry Frappe',
      'description': 'Delicious strawberry blend',
      'price': 3.00,
      'image': 'assets/images/Strawberry_frap.png',
      'count': 0,
    },
    {
      'name': 'Caramel Frappe',
      'description': 'Smooth caramel delight',
      'price': 3.00,
      'image': 'assets/images/caramel_frap.png',
      'count': 0,
    },
  ];

  void increment(int index) {
    setState(() {
      menuItems[index]['count']++;
    });
  }

  void decrement(int index) {
    setState(() {
      if (menuItems[index]['count'] > 0) {
        menuItems[index]['count']--;
      }
    });
  }

  double getTotalPrice() {
    return menuItems.fold(
        0, (sum, item) => sum + (item['count'] * item['price']));
  }

  void proceedToPayment() {
    if (getTotalPrice() > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentScreen(totalAmount: getTotalPrice()),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please add at least one item to proceed."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
      appBar: AppBar(
        title: const Text('Menu',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item['image'],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item['description'],
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    "\$${item['price'].toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => decrement(index),
                                icon: const Icon(Icons.remove,
                                    color: Colors.green),
                              ),
                              Text(
                                '${item['count']}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () => increment(index),
                                icon:
                                    const Icon(Icons.add, color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Order Button
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/payment');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text('Pay Now',
                style: TextStyle(fontSize: 18, color:Colors.white)),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
