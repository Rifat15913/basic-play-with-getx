import 'dart:async';

import 'package:demo_app/ui/home/container/home_container.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void goToNextPage() {
    Get.offAll(
      () => HomeContainerPage(),
    );
  }

  @override
  void onInit() {
    Timer(
      Duration(seconds: 2),
      goToNextPage,
    );
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
