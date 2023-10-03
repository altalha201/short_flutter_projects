import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginCardItems extends StatelessWidget {
  const LoginCardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            "Welcome to password manager!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Login to proceed.",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 16.0),
        const LoginForm(),
      ],
    );
  }
}