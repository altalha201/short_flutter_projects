import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationHelper {
  static to(
    Widget page, {
    Transition? transition,
    Duration? duration,
    Curve? curve,
  }) {
    Get.to(
      page,
      transition: transition ?? Transition.downToUp,
      duration: duration ?? const Duration(seconds: 1),
      curve: curve ?? Curves.easeInOut,
    );
  }

  static off(
    Widget page, {
    Transition? transition,
    Duration? duration,
    Curve? curve,
  }) {
    Get.off(
      page,
      transition: transition ?? Transition.downToUp,
      duration: duration ?? const Duration(seconds: 1),
      curve: curve ?? Curves.easeInOut,
    );
  }

  static offAll(
    Widget page, {
    Transition? transition,
    Duration? duration,
    Curve? curve,
  }) {
    Get.offAll(
      page,
      transition: transition ?? Transition.downToUp,
      duration: duration ?? const Duration(seconds: 1),
      curve: curve ?? Curves.easeInOut,
    );
  }
}
