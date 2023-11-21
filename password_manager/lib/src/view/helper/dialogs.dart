import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/controllers/data_controller.dart';
import '../components/dialogs/password_dialog.dart';
import '../components/dialogs/success_error_dialog.dart';
import '../components/dialogs/warning_dialog.dart';

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

  static warningDialog({
    String? title,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    Color? confirmColor,
    Color? cancelColor,
    String? confirmText,
    String? cancelText,
  }) {
    Get.dialog(
      WarningDialog(
        title: title ?? "Warning",
        message: message,
        confirmColor: confirmColor ?? Colors.red,
        cancelColor: cancelColor ?? Colors.green,
        onConfirm: onConfirm,
        confirmText: confirmText ?? "Confirm",
        cancelText: cancelText ?? "Cancel",
        onCancel: onCancel ?? () {
          Get.back();
        },
      ),
    );
  }
}
