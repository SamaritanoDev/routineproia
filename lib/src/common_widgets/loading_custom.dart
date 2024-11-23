import 'package:flutter/material.dart';
import '../constants/colors_enviroments.dart';

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          CircularProgressIndicator(
            color: Color(colorSecondary),
             semanticsLabel: 'Generando contenido con IA',
            semanticsValue: 'Generando contenido con IA',
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
