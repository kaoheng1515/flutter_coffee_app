import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// Define the ImageProduct class
class ImageProduct {
  final String url;
  final String? altText;

  ImageProduct({
    required this.url,
    this.altText,
  });
}

// Define the Product class
class Product {
  final String title;
  final double price;
  final double rating;
  final List<ImageProduct> images;
  int quantity;

  Product({
    required this.title,
    required this.price,
    required this.rating,
    required this.images,
    this.quantity = 1, // Default quantity is 1
  });
}

// Define the Category class
class Category {
  final String name;
  final List<Product> products;

  Category({
    required this.name,
    this.products = const [],
  });
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  final List<Category> categories = [
    Category(name: 'Cappuccino', products: [
      Product(
        title: 'Cappuccino Classic',
        price: 3.00,
        rating: 4.8,
        images: [
          ImageProduct(
              url: 'assets/images/cappuccino.png',
              altText: 'Cappuccino Classic'),
        ],
      ),
      Product(
        title: 'Cappuccino Vanilla',
        price: 3.50,
        rating: 4.7,
        images: [
          ImageProduct(
              url: 'assets/images/vanilla-cappuccino.png',
              altText: 'Cappuccino Vanilla'),
        ],
      ),
    ]),
    Category(name: 'Latte', products: [
      Product(
        title: 'Latte Art',
        price: 4.50,
        rating: 4.9,
        images: [
          ImageProduct(
              url: 'assets/images/latte_art.png', altText: 'Latte Art'),
        ],
      ),
      Product(
        title: 'Caramel Latte',
        price: 4.80,
        rating: 4.6,
        images: [
          ImageProduct(
              url: 'assets/images/caramel_latte.jpg', altText: 'Caramel Latte'),
        ],
      ),
    ]),
    Category(name: 'Espresso', products: [
      Product(
        title: 'Single Espresso',
        price: 2.50,
        rating: 4.5,
        images: [
          ImageProduct(
              url: 'assets/images/espresso_single.jpg',
              altText: 'Single Espresso'),
        ],
      ),
      Product(
        title: 'Double Espresso',
        price: 3.00,
        rating: 4.7,
        images: [
          ImageProduct(
              url: 'assets/images/espresso_double.jpg',
              altText: 'Double Espresso'),
        ],
      ),
    ]),
  ];

  String selectedCategory = 'Cappuccino';

  @override
  Widget build(BuildContext context) {
    final selectedProducts = categories
        .firstWhere((category) => category.name == selectedCategory)
        .products;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Coffee App',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
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
                hintText: "Search Coffee",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Banner Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio:
                      16 / 7, // Maintains a clean ratio for the banner
                      child: Image.asset(
                        'assets/images/green_banner.png', // Ensure the banner image is in assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Free Delivery',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:
                  50, // Adjusts the position below the "Free Delivery" label
                  left: 10,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'For your first order',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                        fontWeight: FontWeight
                            .bold, // Smaller font size for the tagline
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 90, // Position the "Call Now" button below the tagline
                  left: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for the "Call Now" button (can open phone dialer or another action)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Call Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Category Selector
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8.0),
              itemBuilder: (context, index) {
                final category = categories[index].name;
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
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: selectedProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = selectedProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product_detail');
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image with rating overlay
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.asset(
                                  product.images[0].url,
                                  width: double.infinity,
                                  height: 120, // Adjust the height as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        product.rating.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.title,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  '\$${product.price.toString()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (product.quantity > 1) {
                                            product.quantity--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      '${product.quantity}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          product.quantity++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
