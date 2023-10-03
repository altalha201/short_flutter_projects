import 'package:get/get.dart';

import 'auth_controller.dart';
import 'data_controller.dart';
import 'profile_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(DataController());
    Get.put(ProfileController());
  }
}