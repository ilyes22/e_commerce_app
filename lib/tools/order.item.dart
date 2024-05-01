import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../provider/order.dart' as org;

class OrderItem extends StatefulWidget {
  final org.OrderItems order;
  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Your Order is cost :',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Text(
                      "\$${widget.order.amount}",
                      style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 253, 143, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateFormat().format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    icon:
                        Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ],
              ),
              if (_expanded)
                Column(
                  children: [
                    Divider(),
                    Container(
                      height: min(
                          widget.order.products.length * 20.0 +
                              widget.order.products.length * 45,
                          300),
                      child: ListView(
                          children: widget.order.products
                              .map((e) => Column(
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          e.title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: Text(
                                          '${e.price}x  \$${e.price}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ))
                              .toList()),
                    ),
                  ],
                ),
            ]),
          ),
        ));
  }
}
