import 'image_products.dart';

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