import 'package:e_commerce_app/provider/provider.dart';
import 'package:e_commerce_app/tools/prddetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      final list = provider.productList;
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProductDetails(prd: product),
              ),
            );
          },
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 200,
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(110, 255, 193, 7),
                          Color.fromARGB(255, 240, 240, 240)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        product.photoUrl,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  product.description,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 2.0),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 4.0),
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        provider.removePrd(product);
                        print('list ====================${list.length} ');
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: const Color.fromARGB(255, 255, 182, 25),
                      ),
                      child: Text(
                        provider.getQuantity(product).toString(),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        provider.addToCard(product);

                        print(
                            'list lenght ====================${list.length} ');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
