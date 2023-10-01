import 'package:flutter/material.dart';

class AuthBodyCard extends StatelessWidget {
  const AuthBodyCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 54.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: child,
      ),
    );
  }
}