//

// home.dart

import 'package:e_commerce_app/data/dummy_product.dart';
import 'package:e_commerce_app/data/hot_data.dart';
import 'package:e_commerce_app/model/hotprd.dart';
import 'package:e_commerce_app/model/productContainer.dart';
import 'package:e_commerce_app/provider/provider.dart';
import 'package:e_commerce_app/screen/app/cart.dart';
import 'package:e_commerce_app/screen/drawers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Colors.amber,
          title: const Text('Grocery App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Cart()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        drawer: const KDrawers(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text
              const HeaderText(),

              // Filter Bar
              // FilterBar(),

              ProductList(),
//bottom  Text===============================================================
              BottomText(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return HotDealProductContainer(
                          product: hotDummyData[index],
                          onFavoritePressed: () {});
                    },
                    itemCount: hotDummyData.length,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////////////////////////////////////////////////
///
///
///////////////////////////////////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////////////////////////////////////////////////
///
///

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Goods & Services ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Text(
            'Shop Now ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text(
            'Goods & Services ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
          child: Text(
            'See more ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
