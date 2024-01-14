// product_item.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      leading: Image.network(product.image),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cart.contains(product)) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cartProvider.removeFromCart(product);
                  },
                ),
              ],
            );
          } else {
            return IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartProvider.addToCart(product);
              },
            );
          }
        },
      ),
    );
  }
}
