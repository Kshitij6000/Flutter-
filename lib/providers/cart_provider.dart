// cart_provider.dart

import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  double getTotalPrice() {
    return _cart.fold(0, (total, product) => total + product.price);
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
