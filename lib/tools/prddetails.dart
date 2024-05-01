import 'package:e_commerce_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.prd});
  final Product prd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Colors.amber,
          title: Text(prd.title),
        ),
        body: Consumer<ProductProvider>(builder: (context, productProvider, _) {
          return ListView(
            children: [
              //Up photo
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(24, 255, 193, 7),
                          Color.fromARGB(255, 238, 238, 238)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Hero(
                    tag: 'a',
                    child: Image.network(
                      prd.photoUrl,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  prd.title,
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '\$${prd.price}',
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  prd.description,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          productProvider.removePrd(prd);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.amber),
                        child: const Text(
                          'Delete items',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: const Color.fromARGB(255, 255, 182, 25)),
                        child: Text(
                          productProvider.getQuantity(prd).toString(),
                          style: const TextStyle(fontSize: 25.0),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          productProvider.addToCard(prd);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.amber),
                        child: const Text('Add items'),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
