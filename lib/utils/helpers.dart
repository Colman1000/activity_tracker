import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/config/constants.dart';
import 'package:activity_tracker/models/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Helpers {
  static final context = (Get.context ?? Get.overlayContext)!;

  static void feedback() {
    HapticFeedback.lightImpact();
  }

  static void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.log,
  }) {
    Color color;
    switch (type) {
      case SnackBarType.error:
        color = AppColors.error;
        break;
      case SnackBarType.success:
        color = AppColors.good;
        break;
      case SnackBarType.log:
        color = AppColors.log;
        break;
      case SnackBarType.warn:
        color = AppColors.warning;
        break;
    }

    Constants.scaffoldMessengerKey.currentState?.clearSnackBars();
    Constants.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

    Constants.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: const TextStyle(color: AppColors.white),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        backgroundColor: color,
        dismissDirection: DismissDirection.endToStart,
        behavior: SnackBarBehavior.fixed,
        elevation: 2,
      ),
    );
  }

  static void showErrorSnackBar(String message) {
    showSnackBar(message, type: SnackBarType.error);
  }

  static void showErrorFromAppException(AppException error) {
    showErrorSnackBar(error.message);
  }
}

enum SnackBarType { error, warn, success, log }
