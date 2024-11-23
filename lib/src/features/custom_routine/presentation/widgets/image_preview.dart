import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final Uint8List imageBytes;

  const ImagePreview({
    super.key,
    required this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      imageBytes,
      fit: BoxFit.contain,
      height: 100,
    );
  }
}
