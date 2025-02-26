import 'package:flutter/material.dart';
import '../products/products.dart'; // Ensure this contains the Product and ImageProduct classes.
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

  Product({
    required this.title,
    required this.price,
    required this.rating,
    required this.images,
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
  // Define your products as instances of the Product class
  final List<Product> products = [
    Product(
      title: 'Cappuccino',
      price: 3.00,
      rating: 4.8,
      images: [
        ImageProduct(url: 'assets/images/cappuccino.png', altText: 'Cappuccino'),
      ],
    ),

  ];

  final List<Category> categories = [
    Category(name: 'Cappuccino', products: [
      Product(
        title: 'Cappuccino',
        price: 3.00,
        rating: 4.8,
        images: [
          ImageProduct(url: 'assets/images/cappuccino_classic.jpg', altText: 'Cappuccino Classic'),
        ],
      ),
    ]),
    Category(name: 'Latte', products: [
      Product(
        title: 'Latte Art',
        price: 4.50,
        rating: 4.9,
        images: [
          ImageProduct(url: 'assets/images/latte_art.png', altText: 'Latte Art'),
        ],
      ),
    ]),
    // Add more categories as needed
  ];

  String selectedCategory = 'Cappuccino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Coffee Application',
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
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/poster.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 48.0,
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
                  Positioned(
                    bottom: 30.0,
                    left: 16.0,
                    child: Text(
                      'On your first order',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 16.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.green,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                product.images[0].url, // Display the first image
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Center(child: Text('Image not found')),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$${product.price.toString()}'),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                      size: 16,
                                    ),
                                    Text(product.rating.toString()),
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