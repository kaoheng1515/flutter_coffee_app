import 'package:flutter/material.dart';
// import 'package:flutter_coffee_app/widgets/bottom_nav_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Cappuccino'),
      ),
      body: Column(
        children: [
          Image.asset('assets/cappuccino.jpg'),
          Text('Description: A cappuccino is an approximately 150 ml (5 oz) beverage...'),
          Text('\$2.5'),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text('5.0 (230)'),
            ],
          ),
          // Size Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('S \$2.0'),
              Text('M \$2.5'),
              Text('L \$3.0'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/payment');
              // Add to cart
            },
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}