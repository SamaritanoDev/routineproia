import 'package:flutter/material.dart';
import 'package:routineproia/src/common_widgets/outline_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final String confirmText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Confirmar',
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleLarge?.copyWith(
      color: color.primary,
      fontWeight: FontWeight.bold,
    );

    return AlertDialog(
      title: Text(title, style: titleStyle),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        SizedBox(
          width: 130,
          height: 40,
          child: MyOutlinedButton(
            valueTitle: confirmText,
            onPressed: onConfirm,
          ),
        ),
      ],
    );
  }
}
