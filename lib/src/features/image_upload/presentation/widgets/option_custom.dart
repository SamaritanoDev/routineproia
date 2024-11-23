import 'package:flutter/material.dart';

class OptionCustom extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const OptionCustom({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return IconButton(
      icon: Column(
        children: [
          Icon(icon, color: color.secondary),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: color.secondary),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
