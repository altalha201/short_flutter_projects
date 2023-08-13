import 'package:flutter/material.dart';

class TaskAddDialog extends StatelessWidget {
  const TaskAddDialog({
    Key? key,
    required this.controller,
    required this.onAdd,
    this.validator,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onAdd;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Add New Task",
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              hintText: "Enter a task"),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            controller.clear();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text("Add"),
        ),
      ],
    );
  }
}
