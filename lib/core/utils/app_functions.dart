import 'package:get/get.dart';

class AppFunctions {
  static void buildSnackBar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
