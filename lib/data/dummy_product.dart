import 'package:e_commerce_app/model/productContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class prdList extends StatelessWidget {
//   const prdList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductProvider>(
//       builder: (context, productProvider, _) {
//         return StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('product').snapshots(),
//           builder: (ctx, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             final List<DocumentSnapshot> documents = snapshot.data!.docs;

//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (ctx, index) {
//                 final Map<String, dynamic> data =
//                     documents[index].data() as Map<String, dynamic>;
//                 final String category = data['category'];

//                 bool isCar = category == 'car';
//                 bool isDrink = category == 'drink';
//                 bool isPhone = category == 'phone';
//                 bool isOther = category != 'car' &&
//                     category != 'drink' &&
//                     category != 'phone';
//                 return ProductContainer(
//                   product: Product(

//                       photoUrl: data['img'],
//                       title: data['title'],
//                       price: data['price'] as double,
//                       description: data['description'],
//                       rating: data['rate'],
//                       category: 'category'),
//                 );
//               },
//               itemCount: documents.length,
//             );
//           },
//         );
//       },
//     );
//   }
// }

// prd_list.dart

// prd_list.dart

import 'package:e_commerce_app/provider/provider.dart';

var dummydata = [
  Product(
      photoUrl: 'assets/img/apple.png',
      title: 'title',
      price: 15,
      description: 'description',
      rating: '5',
      category: 'category'),
  Product(
      photoUrl: 'assets/img/g.png',
      title: 'title',
      price: 15,
      description: 'description',
      rating: '5',
      category: 'category'),
  Product(
      photoUrl: 'assets/img/logo.png',
      title: 'title',
      price: 15,
      description: 'description',
      rating: '5',
      category: 'category'),
  Product(
      photoUrl: 'assets/img/fb.png',
      title: 'title',
      price: 15,
      description: 'description',
      rating: '5',
      category: 'category'),
];

// class od data snapshot
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('product').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          // Store fetched documents in a local variable
          List<Product> productList = documents.map((doc) {
            final Map<String, dynamic> data =
                doc.data() as Map<String, dynamic>;
            return Product(
              photoUrl: data['img'],
              title: data['title'],
              price: data['price'] as double,
              description: data['description'],
              rating: data['rate'],
              category: data['category'],
            );
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  // Use the local product list
                  return ProductContainer(
                    product: dummydata[index],
                  );
                },
                itemCount: documents.length,
              ),
            ),
          );
        },
      );
    });
  }
}
