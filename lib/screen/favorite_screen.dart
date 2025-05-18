import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/widgets/bottom_nav_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String? _selectedValue;
  List<String> sortByList = ["First", "Second", "Third"];
  bool isFavorite1 = false;
  bool isFavorite2 = false;
  bool isFavorite3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(currentIndex: 0),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Favorite',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 35, right: 20, bottom: 35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coffee",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedValue,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      items: sortByList
                          .map((String item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      hint: Text(
                        "Sort by",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // First item container
              _buildCoffeeItem(
                "Cappuccino",
                "assets/images/cappuccino.png",
                "\$3.99",
                isFavorite1,
                    () {
                  setState(() {
                    isFavorite1 = !isFavorite1;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Caramel Frappe",
                "assets/images/caramel_frap.png",
                "\$5.50",
                isFavorite2,
                    () {
                  setState(() {
                    isFavorite2 = !isFavorite2;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Green Tea Frappe",
                "assets/images/Green Tea Frappe.png",
                "\$3.00",
                isFavorite3,
                    () {
                  setState(() {
                    isFavorite3 = !isFavorite3;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Strawberry Frappe",
                "assets/images/Strawberry_frap.png",
                "\$2.50",
                isFavorite3,
                    () {
                  setState(() {
                    isFavorite3 = !isFavorite3;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Iced Green Tea ",
                "assets/images/Iced Green Tea Latte.png",
                "\$2.00",
                isFavorite3,
                    () {
                  setState(() {
                    isFavorite3 = !isFavorite3;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Orange Juice ",
                "assets/images/orange_juice.png",
                "\$1.50",
                isFavorite3,
                    () {
                  setState(() {
                    isFavorite3 = !isFavorite3;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Strawberry Frappe Small ",
                "assets/images/Strawberry_frap_small.png",
                "\$2.50",
                isFavorite3,
                    () {
                  setState(() {
                    isFavorite3 = !isFavorite3;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildCoffeeItem(
                "Ice Cream ",
                "assets/images/Ice_cream.png",
                "\$2.99",
                isFavorite3,
                    () {
                  setState(() {
                    isFavorite3 = !isFavorite3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeItem(String name, String imagePath, String price, bool isFavorite, VoidCallback onFavoriteToggle) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 230,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.green,
                ),
                onPressed: onFavoriteToggle,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 