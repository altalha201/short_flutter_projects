import 'package:get/get.dart';

import 'src/controller/button_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ButtonController());
  }
}