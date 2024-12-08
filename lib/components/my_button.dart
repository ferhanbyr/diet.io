import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String butonText;

  const MyButton({Key? key, required this.onTap, required this.butonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Button tapped!"); // Bu satırı debug amaçlı tutuyoruz
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(227, 156, 230, 71),
        ),
        child: Center(
          child: Text(
            butonText,
            style: const TextStyle(
              color: Color.fromARGB(255, 10, 7, 7),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
