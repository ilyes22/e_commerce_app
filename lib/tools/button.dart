import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {super.key,
      required this.color,
      required this.enterbtn,
      required this.texColors,
      required this.onTap});

  final Widget enterbtn;
  final Color color;
  final void Function() onTap;
  final Color texColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: texColors),
      onPressed: onTap,
      child: enterbtn,
    );
  }
}
