import 'dart:ui';

import 'package:e_commerce_app/screen/logScreen.dart';
import 'package:e_commerce_app/tools/button.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 5),
                child: Image.asset(
                  'assets/img/logo.png',
                  width: 300,
                  height: 350,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/img/logo_name.png',
                color: Colors.amber,
                width: double.infinity,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                color: const Color.fromARGB(171, 0, 0, 0),
                enterbtn: const Text('Start Now'),
                texColors: Colors.amber,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const LogSCREEN()),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(3),
                child: Text(
                  'use the application',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
