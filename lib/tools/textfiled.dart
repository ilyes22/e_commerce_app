import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  InputText(
      {super.key,
      required this.text,
      required this.isObscure,
      required this.controller});
  final String text;
  final bool isObscure;
  final TextEditingController controller;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  String user = 'ggggg';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: TextStyle(color: Colors.amber),
      controller: widget.controller,
      cursorColor: Colors.amber,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 10.0), // Adjust content padding

        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ), // Adjust the radius as needed
          // You can customize the border color and width here
        ),
        label: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            widget.text,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      //validation
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'invalid input ';
        }
        return null;
      },
    );
  }
}
