import 'package:e_commerce_app/provider/order.dart';
import 'package:e_commerce_app/tools/order.item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  get products => null;

  @override
  Widget build(BuildContext context) {
    final _order = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Colors.amber,
          title: const Text('Your Orders'),
        ),
        body: _order.orders.isEmpty
            ? const Center(
                child: Text(
                'No orders added yet.!',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ))
            : ListView.builder(
                itemBuilder: (ctx, i) => OrderItem(_order.orders[i]),
                itemCount: _order.orders.length,
              ));
  }
}
