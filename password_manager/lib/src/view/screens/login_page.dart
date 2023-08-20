import 'package:flutter/material.dart';

import '../components/filed_text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(62.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                    const FiledTextInput(hintText: "Email address",),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}