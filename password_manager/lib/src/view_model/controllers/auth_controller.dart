import 'package:get/get.dart';

import '../../view/screens/login_screen/login_page.dart';
import '../services/auth_service.dart';
import 'profile_controller.dart';

class AuthController extends GetxController {
  bool _loginInProgress = false, _creatingAuth = false;

  bool get loginInProgress => _loginInProgress;

  bool get creatingAuth => _creatingAuth;

  Future<bool> login(String email, String pass) async {
    _loginInProgress = true;
    update();
    final response = await AuthService.login(email, pass);
    _loginInProgress = false;
    if (response.isSuccess) {
      final isSaved =
          await Get.find<ProfileController>().setUser(response.body);
      update();
      return isSaved;
    } else {
      update();
      return false;
    }
  }

  Future<bool> createAccount(String email, String name, String pass) async {
    _creatingAuth = true;
    update();
    final response = await AuthService.createAuth(email, pass);
    _creatingAuth = false;
    if (response.isSuccess) {
      final isCreated = await Get.find<ProfileController>()
          .createNewUser(response.body, name, email, pass);
      update();
      return isCreated;
    } else {
      update();
      return false;
    }
  }

  Future<void> logOutUser() async {
    await AuthService.logout();
    Get.find<ProfileController>().clearCurrent();
    Get.offAll(const LoginPage());
  }
}
