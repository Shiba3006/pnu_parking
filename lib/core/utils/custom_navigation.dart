import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigation {
  static void goToDownUp({required Widget widget, Object? arguments}) {
    Get.to(()=>widget, transition: Transition.downToUp, arguments: arguments);
  }

  static void goToUpDown({required Widget widget, Object? arguments}) {
    Get.to(()=>widget, transition: Transition.upToDown, arguments: arguments);
    
  }
}
