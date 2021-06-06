import 'dart:async';

import 'package:flutter/services.dart';
import 'package:football_trivia/ui/home/container/home_container.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void goToNextPage() {
    Get.offAll(
      () => HomeContainerPage(),
    );
  }

  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    Timer(
      Duration(seconds: 2),
      goToNextPage,
    );
    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.onClose();
  }
}
