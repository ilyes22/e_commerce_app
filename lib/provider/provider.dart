import 'package:flutter/material.dart';

class Product {
  final String photoUrl;
  final String title;
  final double price;
  final String description;
  final String rating;
  final String category;

  Product({
    required this.photoUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.rating,
    required this.category,
  });
}

class ProductProvider extends ChangeNotifier {
  List<Product> _list = [];
// Initialize with an empty list
  Map<Product, int> _quantityMap = {};

  // Getters
  List<Product> get productList => _list;

  double get getTotalQuantity {
    double totalQuantity = 0;
    for (var quantity in _quantityMap.values) {
      totalQuantity += quantity;
    }
    return totalQuantity;
  }

// Get the quantity for a specific product
  int getQuantity(Product product) {
    return _quantityMap.containsKey(product) ? _quantityMap[product]! : 0;
  }

  // Calculate total price considering quantity
  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var entry in _quantityMap.entries) {
      totalPrice += entry.key.price * entry.value;
    }
    return totalPrice;
  }

  void addToCard(Product product) {
    if (_quantityMap.containsKey(product)) {
      _quantityMap[product] = _quantityMap[product]! + 1;
    } else {
      _list.add(product);
      _quantityMap[product] = 1;
    }
    notifyListeners(); // Notify listeners after modifying the cart
  }

  void removePrd(Product prd) {
    if (_quantityMap.containsKey(prd)) {
      if (_quantityMap[prd] == 1) {
        _list.remove(prd);
        _quantityMap.remove(prd);
      } else {
        _quantityMap[prd] = _quantityMap[prd]! - 1;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _list = [];
    _quantityMap.clear();
    notifyListeners();
  }

  // Remove from cart or decrement quantity
}
