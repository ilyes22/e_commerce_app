import 'package:e_commerce_app/screen/app/profile.dart';
import 'package:e_commerce_app/screen/orders.dart';
import 'package:flutter/material.dart';

class KDrawers extends StatelessWidget {
  const KDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('SideBar'),
          foregroundColor: Colors.amber),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => OrderScreen()));
                },
                leading: const CircleAvatar(
                  foregroundColor: Colors.amber,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.payment),
                ),
                title: const Text(
                  'Orders',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const Profile()));
                },
                leading: const CircleAvatar(
                  foregroundColor: Colors.amber,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person),
                ),
                title: const Text(
                  'profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
