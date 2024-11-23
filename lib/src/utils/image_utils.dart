import 'dart:typed_data';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<Uint8List?> getImageBytes(PlatformFile file) async {
  if (file.path != null) {
    // Leemos los bytes desde la ruta.
    try {
      final imageFile = File(file.path!);
      return await imageFile.readAsBytes();
    } catch (e) {
      debugPrint("Error al leer la imagen desde la ruta: $e");
      return null;
    }
  }
  return null;
}
