import 'package:flutter/material.dart';

class SuccessErrorDialog extends StatelessWidget {
  const SuccessErrorDialog({
    super.key,
    this.success = true,
    required this.message,
  });

  final bool success;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(success ? "Success" : "Failed"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
