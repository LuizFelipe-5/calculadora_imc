import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 50,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
