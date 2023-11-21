import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmColor,
    required this.cancelColor,
    required this.confirmText,
    required this.cancelText,
  });

  final String title, message, confirmText, cancelText;
  final VoidCallback onConfirm, onCancel;
  final Color confirmColor, cancelColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onConfirm,
          style: TextButton.styleFrom(
            foregroundColor: confirmColor,
          ),
          child: const Text("Confirm"),
        ),
        TextButton(
          onPressed: onCancel,
          style: TextButton.styleFrom(
            foregroundColor: cancelColor,
          ),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
