import 'package:e_commerce_app/provider/order.dart';
import 'package:e_commerce_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.amber,
        title: const Text("Cart list"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          List<Product> productList = productProvider.productList;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(197, 255, 138, 4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Row(
                          children: [
                            const Text(
                              'Total price',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '${productProvider.getTotalPrice()} \$',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: ElevatedButton(
                            onPressed: () {
                              if (productProvider.getTotalPrice() == 0) {
                                return;
                              }

                              Provider.of<Orders>(context, listen: false)
                                  .addOrder(productList,
                                      productProvider.getTotalPrice());

                              productProvider.clearCart();
                            },
                            child: const Text(
                              'Add To Card',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 1, 53)),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              productList.isNotEmpty
                  ? SizedBox(
                      height: 380,
                      child: ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          Product product = productList[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                  child: Image.asset(
                                product.photoUrl,
                                fit: BoxFit.fitHeight,
                              )),
                              title: Text(product.title),
                              subtitle: Text(product.description),
                              trailing: SizedBox(
                                width: 130,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        productProvider.removePrd(product);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        productProvider.addToCard(product);
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: const Color.fromARGB(
                                              255, 255, 182, 25)),
                                      child: Text(
                                        productProvider
                                            .getQuantity(product)
                                            .toString(),
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/11010/11010851.png',
                            color: Colors.black12,
                            height: 150,
                            width: 300,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'you had add no item Yet!!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
