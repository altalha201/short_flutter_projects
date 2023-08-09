import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopMessages {
  static showAlert({
    required String title,
    required String messages,
    required VoidCallback onTap,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: messages,
      contentPadding: const EdgeInsets.all(16.0),
      confirm: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(foregroundColor: Colors.green),
        child: const Text(
          "OK",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
