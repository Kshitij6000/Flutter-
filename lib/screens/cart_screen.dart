// cart_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (context, index) {
          final product = cartProvider.cart[index];
          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${cartProvider.getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                cartProvider.clearCart();
              },
              child: Text('BUY', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
