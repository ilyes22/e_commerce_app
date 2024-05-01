import 'package:flutter/material.dart';

// ignore: must_be_immutable
class kList extends StatelessWidget {
  kList(
      {super.key, required this.icons, required this.title, required this.tap});
  final String title;
  final IconData icons;
  void Function() tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        color: Colors.black,
        child: ListTile(
          onTap: tap,
          title: Text(
            title,
          ),
          textColor: Colors.white,
          trailing: Icon(
            icons,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
