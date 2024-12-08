import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onTap;
  final String imagePath;

  MyCard({
    required this.color,
    required this.text,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none, // Kesme davranışı devre dışı
        children: [
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "DynaPuff",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: -50,
            top: -35,
            child: Image.asset(
              imagePath,
              width: 130,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
