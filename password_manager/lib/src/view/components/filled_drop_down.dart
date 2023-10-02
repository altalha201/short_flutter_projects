import 'package:flutter/material.dart';

class FilledDropDown extends StatelessWidget {
  const FilledDropDown({
    super.key,
    this.hintText,
    required this.items,
    required this.onChanged,
    this.validator,
    this.value,
  });

  final String? hintText;
  final dynamic value;
  final List<DropdownMenuItem<dynamic>> items;
  final void Function(dynamic) onChanged;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      validator: validator,
      value: value,
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
      dropdownColor: Colors.blueGrey.shade300,
      onChanged: onChanged,
    );
  }
}
