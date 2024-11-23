import 'package:flutter/material.dart';

class ImageCustom extends StatelessWidget {
  final String imagePath;
  const ImageCustom({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
