import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final Function()? imagePressed;
  final String imagePath;
  const SquareTitle({
    super.key,
    required this.imagePath,
    required this.imagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: imagePressed,
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
