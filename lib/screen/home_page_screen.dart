import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  final List<String> categories = [
    'Cappuccino',
    'Macchiato',
    'Latte',
    'Decaf',
    'Espresso'
  ];

  final List<Map<String, dynamic>> products = [
    {
      'title': 'Cappuccino',
      'image': 'assets/images/cappuccino_classic.jpg', // Local path
      'price': 3.00,
      'rating': 4.8,
      'description': 'A cappuccino is a classic Italian coffee drink...',
      'reviews': 230,
      'sizeSPrice': 2.0,
      'sizeMPrice': 2.5,
      'sizeLPrice': 3.0,
    },
    {
      'title': 'Cappuccino 11',
      'image': 'assets/images/boy.png', // Local image path
      'price': 3.00,
      'rating': 4.8,
    },
    // Add other products here

    // {
    //     'title': 'Cappuccino Classic',
    //     'image': 'https://via.placeholder.com/150',
    //     'price': 3.00,
    //     'rating': 4.8,
    //   },
    {
      'title': 'Cappuccino Chiaro',
      'image': 'https://via.placeholder.com/150',
      'price': 2.00,
      'rating': 5.0,
    },
    {
      'title': 'Latte Art',
      'image': 'https://via.placeholder.com/150',
      'price': 4.50,
      'rating': 4.9,
    },
  ];

  String selectedCategory = 'Cappuccino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green, // AppBar background color
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/user.png'), // Local asset image
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Coffee',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          // Promo Banner
          // Flexible(
          //   flex: 1,
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 16.0),
          //     padding: const EdgeInsets.all(16.0),
          //     decoration: BoxDecoration(
          //       color: Colors.green.shade100,
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     // child: Center(
          //     //   child: Image.network(
          //     //     'https://via.placeholder.com/150', // Replace with actual image URL
          //     //     height: 80,
          //     //     fit: BoxFit.contain,
          //     //   ),
          //     // ),
          //     child: Center(
          //       child: Image.asset(
          //         'assets/images/poster.png, height: 80, fit: BoxFit.contain',
          //       ),
          //     ),
          //   ),
          // ),
          // PROMOTION banner
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(
                  0), // Remove padding for full screen effect
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Image background
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/poster.png', // Image path
                      fit: BoxFit.cover, // Ensure image fills the container
                    ),
                  ),
                  // Overlay text (e.g., "Free Delivery")
                  Positioned(
                    bottom: 48.0, // Positioning the main text
                    left: 16.0,
                    child: Text(
                      'Free Delivery',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Small "Later" text and note about free delivery on first order
                  Positioned(
                    bottom: 30.0, // Positioned just above "Order Now"
                    left: 16.0,
                    child: Text(
                      'On your first order',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // "Order Now" button with an icon
                  Positioned(
                    bottom: 0, // Positioned at the bottom
                    left: 16.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart, // Icon for Order Now
                          color: Colors.black,
                          size: 24.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Order Now!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8.0),

          // Category Selector
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 8.0),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.green,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8.0),

          // Product Grid
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product_detail',
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              // child: Image.network(
                              //   product['image'],
                              //   width: double.infinity,
                              //   fit: BoxFit.cover,
                              // ),
                              child: Image.asset(
                                'assets/images/boy.png${product['image']}', // Assuming product['image'] holds the image name
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$${product['price'].toString()}'),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                      size: 16,
                                    ),
                                    Text(product['rating'].toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
