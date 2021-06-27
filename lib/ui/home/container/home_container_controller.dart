import 'package:demo_app/ui/home/content/home_content.dart';
import 'package:demo_app/ui/shop/view/shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContainerController extends GetxController {
  late Widget body;
  late int selectedBottomBarIndex;
  late Rx<int> cartCount;

  @override
  void onInit() {
    body = HomeContentPage();
    selectedBottomBarIndex = 0;
    cartCount = 0.obs;

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addToCart() {
    cartCount.value = (cartCount.value + 1);
  }

  void changeBottomBarIndex(int index) {
    selectedBottomBarIndex = index;

    switch (index) {
      case 0:
        body = HomeContentPage();
        break;

      case 1:
        body = ShopPage();
        break;

      default:
        break;
    }

    update(['bottom_bar', 'body']);
  }
}
