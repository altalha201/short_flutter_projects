import 'package:get/get.dart';

import '../../view_model/controllers/data_controller.dart';
import '../components/dialogs/password_dialog.dart';
import '../components/dialogs/success_error_dialog.dart';

class Dialogs {
  static successErrorDialog({bool success = true, required String message}) {
    Get.dialog(
      SuccessErrorDialog(
        message: message,
        success: success,
      ),
    );
  }

  static passwordDialog({
    required String password,
    required String siteName,
    required String loginInfo,
  }) {
    var pass = DataController().getPassword(password);
    Get.dialog(
      PasswordDialog(
        siteName: siteName,
        pass: pass,
        loginInfo: loginInfo,
      ),
    );
  }
}
