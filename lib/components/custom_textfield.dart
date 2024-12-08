import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType; // `keyboardType` değişkeni ekleniyor.

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    required this.keyboardType, // Constructor'a ekleniyor.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEEF7E8), // Light green background
        border: Border.all(
          color: const Color(0xFF8BC34A), // Green border
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType, // Burada `keyboardType` kullanılıyor.
              validator: validator,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontFamily: 'DynaPuff',
            ),
          ),
        ],
      ),
    );
  }
}
