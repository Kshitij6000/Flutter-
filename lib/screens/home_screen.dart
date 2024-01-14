// home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      image: 'assets/images/phone2.jpg',
      name: 'iPhone 15',
      price: 999.99,
    ),
    Product(
      image: 'assets/images/Mac.jpeg',
      name: 'MacBook Pro',
      price: 1999.99,
    ),
    Product(
      image: 'assets/images/Ipad pro.jpeg',
      name: 'iPad',
      price: 1129.99,
    ),
    Product(
      image: 'assets/images/S23 Ultra.jpeg',
      name: 'S23 Ultra',
      price: 1999.99,
    ),
    Product(
      image: 'assets/images/Glasses.jpeg',
      name: 'Glasses',
      price: 999.99,
    ),
    Product(
      image: 'assets/images/Wallet.jpeg',
      name: 'Wallet',
      price: 299.99,
    ),
    Product(
      image: 'assets/images/Books.jpeg',
      name: 'Book',
      price: 99.99,
    ),
    Product(
      image: 'assets/images/Rolex.jpeg',
      name: 'Rolex',
      price: 19999.99,
    ),
    Product(
      image: 'assets/images/SmartWatch.jpeg',
      name: 'Smart Watch',
      price: 1999.99,
    ),
    Product(
      image: 'assets/images/Airpods.jpeg',
      name: 'Air Pods',
      price: 1239.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}
