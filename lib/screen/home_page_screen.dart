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
          ImageProduct(url: 'assets/images/cappuccino.png', altText: 'Cappuccino Classic'),
        ],
      ),
      Product(
        title: 'Cappuccino Vanilla',
        price: 3.50,
        rating: 4.7,
        images: [
          ImageProduct(url: 'assets/images/vanilla-cappuccino.png', altText: 'Cappuccino Vanilla'),
        ],
      ),
    ]),
    Category(name: 'Latte', products: [
      Product(
        title: 'Latte Art',
        price: 4.50,
        rating: 4.9,
        images: [
          ImageProduct(url: 'assets/images/latte_art.jpeg', altText: 'Latte Art'),
        ],
      ),
      Product(
        title: 'Caramel Latte',
        price: 4.80,
        rating: 4.6,
        images: [
          ImageProduct(url: 'assets/images/latte_caramel.jpeg', altText: 'Caramel Latte'),
        ],
      ),
    ]),
    Category(name: 'Espresso', products: [
      Product(
        title: 'Single Espresso',
        price: 2.50,
        rating: 4.5,
        images: [
          ImageProduct(url: 'assets/images/caramel_frap.png', altText: 'Single Espresso'),
        ],
      ),
      Product(
        title: 'Double Espresso',
        price: 3.00,
        rating: 4.7,
        images: [
          ImageProduct(url: 'assets/images/Green Tea Frappe.png', altText: 'Double Espresso'),
        ],
      ),
    ]),
  ];

  String selectedCategory = 'All'; // Default category is "All"

  @override
  Widget build(BuildContext context) {
    // If selected category is "All", show all products
    final selectedProducts = selectedCategory == 'All'
        ? categories.expand((category) => category.products).toList()
        : categories.firstWhere((category) => category.name == selectedCategory).products;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Coffee App',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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

          // Banner Section (Fixed)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0),
                      blurRadius: 0,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/banner_free.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          // Category Selector
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: categories.length + 1,
              separatorBuilder: (context, index) => const SizedBox(width: 8.0),
              itemBuilder: (context, index) {
                final category = index == 0 ? 'All' : categories[index - 1].name;
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
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: Image.asset(
                                  product.images[0].url,
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Row(
                                  children: List.generate(5, (starIndex) {
                                    return Icon(
                                      starIndex < product.rating
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.yellow,
                                      size: 16,
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text('\$${product.price.toString()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      if (product.quantity > 1) {
                                        product.quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text('${product.quantity}', style: const TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: const Icon(Icons.add, color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      product.quantity++;
                                    });
                                  },
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
