import 'package:get/get.dart';

class AuthController extends GetxController {
  bool _loginInProgress = false, _creatingAuth = false;

  bool get loginInProgress => _loginInProgress;
  bool get creatingAuth => _creatingAuth;

  Future<void> login(String email, String pass) async {
    _loginInProgress = true;
    update();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      _loginInProgress = false;
      update();
    });
  }

  Future<void> createAccount() async {
    _creatingAuth = true;
    update();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      _creatingAuth = false;
      update();
    });
  }
}