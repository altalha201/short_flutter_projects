import 'package:flutter/material.dart';

import '../../components/auth_body_card.dart';
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
          const Center(
            child: AuthBodyCard(
              child: LoginCardItems(),
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
