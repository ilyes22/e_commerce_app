import 'package:e_commerce_app/SignUp/login.dart';
// import 'package:e_commerce_app/screen/app/favorite.dart';
// import 'package:e_commerce_app/screen/app/home.dart';
import 'package:e_commerce_app/screen/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogSCREEN extends StatelessWidget {
  const LogSCREEN({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const MainPage();
          }
          return const LogIn();
        }));
  }
}
