import 'package:flutter/material.dart';

class CurrencyConverterTextField extends StatelessWidget {
  const CurrencyConverterTextField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.label,
    required this.prefix,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String) onChanged;
  final String label;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        prefixText: prefix,
        prefixStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
