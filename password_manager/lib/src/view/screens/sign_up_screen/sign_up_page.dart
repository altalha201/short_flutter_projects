import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/auth_body_card.dart';
import '../../components/floating_text_button.dart';
import '../../helper/navigation_helper.dart';
import '../login_screen/login_page.dart';
import 'sign_up_items.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void _goToLogin() {
    NavigationHelper.off(
      const LoginPage(),
      transition: Transition.upToDown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: AuthBodyCard(
              child: SignUpItems(),
            ),
          ),
          FloatingTextButton(
            onTap: _goToLogin,
            firstText: "Already have an account?",
            secondText: "Login",
          ),
        ],
      ),
    );
  }
}
