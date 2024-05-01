import 'package:e_commerce_app/provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth user = FirebaseAuth.instance;

class OrderItems {
  final List<Product> products;
  final double amount;
  OrderItems({required this.products, required this.amount});
}

class Orders with ChangeNotifier {
  List<OrderItems> _order = [];
  List<OrderItems> get orders {
    return [..._order];
  }

  void addOrder(List<Product> orderNow, double total) async {
    await firestore.collection('order').add({
      'price': total,
      'product_amount': orderNow.length,
      'date': Timestamp.now(),
    });

    _order.insert(0, OrderItems(amount: total, products: orderNow));

    notifyListeners();
  }
}
