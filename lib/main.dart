import 'package:flutter/material.dart';
import 'package:routineproia/src/features/image_upload/presentation/screens/home_screen.dart';

import 'src/constants/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(myColorPrimary),
        // ),
      ),
      home: const HomeScreen(),
    );
  }
}
