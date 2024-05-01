import 'package:e_commerce_app/tools/bottombar.dart';
import 'package:e_commerce_app/screen/app/cart.dart';
import 'package:e_commerce_app/screen/app/payment.dart';
import 'package:e_commerce_app/screen/app/home.dart';
import 'package:e_commerce_app/screen/app/profile.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? index;
  @override
  Widget build(BuildContext context) {
    Widget ctx = const Home();
    if (index == 1) {
      setState(() {
        ctx = const Cart();
      });
    }
    if (index == 2) {
      setState(() {
        ctx = const Payment();
      });
    }
    if (index == 3) {
      setState(() {
        ctx = const Profile();
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomBar(
        tapBottom: (x) {
          setState(() {
            index = x;
          });
          print('hhhhhhhhhhhhh$index');
        },
      ),
      body: ctx,
    );
  }
}
