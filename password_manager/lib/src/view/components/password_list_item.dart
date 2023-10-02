import 'package:flutter/material.dart';

class PasswordListItem extends StatelessWidget {
  const PasswordListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        tileColor: Colors.blueGrey.shade300,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        leading: Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: Colors.white70
          ),
        ),
        title: const Text("Site Name."),
        subtitle: const Text("User name or email"),
      ),
    );
  }
}