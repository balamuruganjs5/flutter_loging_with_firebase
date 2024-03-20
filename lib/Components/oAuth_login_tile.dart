// ignore: file_names
import 'package:flutter/material.dart';

class OAuthLoginTile extends StatelessWidget {

  final Function()? onTap;
  final String imagePath;
  const OAuthLoginTile({super.key, required this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          border: Border.all(
            color: Colors.white,
          )
        ),
        child: Image(image: AssetImage(imagePath), height: 60),
      ),
    );
  }
}