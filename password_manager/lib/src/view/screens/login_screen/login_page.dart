import 'package:flutter/material.dart';

import '../../components/floating_text_button.dart';
import '../../helper/navigation_helper.dart';
import '../sign_up_screen/sign_up_page.dart';
import 'login_card_items.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void onSignUpTap() {
    NavigationHelper.to(const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 4,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 54.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: LoginCardItems(),
              ),
            ),
          ),
          FloatingTextButton(
            onTap: onSignUpTap,
            firstText: "Have no account?",
            secondText: "Create Now",
          ),
        ],
      ),
    );
  }
}
