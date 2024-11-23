import 'package:flutter/material.dart';
import 'package:routineproia/src/constants/colors_enviroments.dart';

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? valueTitle;

  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    this.valueTitle,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final textButtonStyle =
        textTheme.bodyLarge?.copyWith(color: color.onPrimary);

    return OutlinedButton.icon(
      onPressed: onPressed,
      label: Text(valueTitle ?? 'Generar contenido', style: textButtonStyle),
      style: OutlinedButton.styleFrom(
        backgroundColor: color.primary,
        side: const BorderSide(color: Color(myColorPrimary)),
        minimumSize: const Size(300, 50),
      ),
    );
  }
}
