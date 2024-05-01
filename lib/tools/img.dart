import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  const Img(
      {super.key,
      required this.name,
      required this.height,
      required this.width});
  final String name;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: Image.asset(
        name,
        height: height,
        width: width,
      ),
    );
  }
}
