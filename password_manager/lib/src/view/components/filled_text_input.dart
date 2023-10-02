import 'package:flutter/material.dart';

class FilledTextInput extends StatelessWidget {
  const FilledTextInput({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey.shade300,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusColor: Colors.black,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
