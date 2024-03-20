import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Function()? onTap;
  final String title;

  const Button({super.key, this.onTap, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16))
        )
      ),
    );
  }
}