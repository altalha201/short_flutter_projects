import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controllers/auth_controller.dart';
import '../../components/filed_text_input.dart';
import '../../components/loadings/circle_loading.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  late final TextEditingController _nameET, _emailET, _passET;

  String? _emailValidator(String? value) {
    if (!EmailValidator.validate(value?.trim() ?? "")) {
      return "Enter a valid email";
    }
    return null;
  }

  String? _nameValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Name required";
    }
    return null;
  }

  String? _passValidator(String? value) {
    if ((value?.length ?? 0) <= 5) {
      return "Enter your 6 digit password";
    }
    return null;
  }

  String? _confirmValidation(String? value) {
    if (_passET.text != value) {
      return "Password not matched";
    }
    return null;
  }

  void _signUp() {
    if (_signUpKey.currentState?.validate() ?? false) {
      Get.find<AuthController>()
          .createAccount(_emailET.text.trim(), _nameET.text, _passET.text);
    }
  }

  @override
  void initState() {
    _nameET = TextEditingController();
    _emailET = TextEditingController();
    _passET = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameET.dispose();
    _emailET.dispose();
    _passET.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpKey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          FiledTextInput(
            hintText: "Email",
            controller: _emailET,
            validator: _emailValidator,
          ),
          const SizedBox(height: 8.0),
          FiledTextInput(
            hintText: "Name",
            controller: _nameET,
            validator: _nameValidator,
          ),
          const SizedBox(height: 8.0),
          FiledTextInput(
            hintText: "Password",
            controller: _passET,
            validator: _passValidator,
          ),
          const SizedBox(height: 8.0),
          FiledTextInput(
            hintText: "Reenter Password",
            validator: _confirmValidation,
          ),
          const SizedBox(height: 16.0),
          _buttonSection(),
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return SizedBox(
      width: double.maxFinite,
      child: GetBuilder<AuthController>(
        builder: (authController) {
          if (authController.creatingAuth) {
            return const CircleLoading();
          }
          return ElevatedButton(
            onPressed: _signUp,
            child: const Text("Sign Up"),
          );
        },
      ),
    );
  }
}
