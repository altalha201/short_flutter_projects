import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controllers/auth_controller.dart';
import '../../components/filled_text_input.dart';
import '../../components/loadings/circle_loading.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  late final TextEditingController _emailET, _passET;

  String? _emailValidator(String? value) {
    if (!EmailValidator.validate(value?.trim() ?? "")) {
      return "Enter a valid email";
    }
    return null;
  }

  String? _passValidator(String? value) {
    if ((value?.length ?? 0) <= 5) {
      return "Enter your 6 digit password";
    }
    return null;
  }

  Future<void> loginOnPress() async {
    if (_loginKey.currentState!.validate()) {
      await Get.find<AuthController>()
          .login(_emailET.text.trim(), _passET.text);
    }
  }

  @override
  void initState() {
    _emailET = TextEditingController();
    _passET = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailET.dispose();
    _passET.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Column(
        children: [
          FilledTextInput(
            hintText: "Email address",
            validator: _emailValidator,
            controller: _emailET,
          ),
          const SizedBox(height: 8.0),
          FilledTextInput(
            hintText: "Password",
            validator: _passValidator,
            controller: _passET,
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 120,
                child: GetBuilder<AuthController>(builder: (auth) {
                  if (auth.loginInProgress) {
                    return const CircleLoading();
                  }
                  return ElevatedButton(
                    onPressed: loginOnPress,
                    child: const Text("Login"),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
