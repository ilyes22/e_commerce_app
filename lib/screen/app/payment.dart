import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Colors.amber,
          title: const Text('Order History'),
          actions: [],
        ),
        body: Consumer<ProductProvider>(
          builder: (context, productProvider, _) {
            // List<Product> favList = productProvider.;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('order').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // or any loading indicator
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    // No documents exist
                    return const Text('No documents found');
                  }
                  // Documents exist, display them as a list
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot document =
                          snapshot.data!.docs[index];
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      double price = data['price'];
                      int productAmount = data['product_amount'];
                      Timestamp timestamp = data['date'];
                      DateTime date = timestamp.toDate();
                      String formattedDate = DateFormat.yMMMd().format(date);
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('$productAmount\X  Product'),
                            leading: Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '$price \$',
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            trailing: Text(formattedDate),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ));
  }
}
