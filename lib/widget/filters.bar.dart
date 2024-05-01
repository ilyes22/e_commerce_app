// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app/provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// class FilterBar extends StatelessWidget {
//   FilterBar({super.key});

//   Widget build(BuildContext context) {
//     return Consumer<ProductProvider>(builder: (context, productProvider, _) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // productProvider.filterProduct(Filters.isPhone, true);
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     'Phone',
//                     style: TextStyle(color: Colors.amber),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               // Second filter option
//               GestureDetector(
//                 onTap: () {
//                   // productProvider.filterProduct(Filters.isDrink, true);
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     'Drink',
//                     style: TextStyle(color: Colors.amber),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               // Third filter option
//               GestureDetector(
//                 onTap: () {
//                   // productProvider.filterProduct(Filters.isCar, true);
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     'Cars',
//                     style: TextStyle(color: Colors.amber),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               // Fourth filter option
//               GestureDetector(
//                 onTap: () {
//                   // productProvider.filterProduct(Filters.isOther, true);
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     'Others',
//                     style: TextStyle(color: Colors.amber),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
