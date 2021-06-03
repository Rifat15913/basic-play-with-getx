import 'package:flutter/material.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/profile/view/view_profile.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class HomeContainerController extends GetxController {
  late Widget body;
  late int selectedBottomBarIndex;
  late String appBarTitle;

  @override
  void onInit() {
    body = Center(
      child: Text("Page 1"),
    );
    selectedBottomBarIndex = 0;
    appBarTitle = 'home'.tr;

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeBottomBarIndex(int index) {
    selectedBottomBarIndex = index;

    switch (index) {
      case 0:
        appBarTitle = 'home'.tr;
        body = Center(
          child: Text("Page 1"),
        );
        ;
        break;

      case 1:
        appBarTitle = 'leader_board'.tr;
        body = Center(
          child: Text("Page 2"),
        );
        ;
        break;

      case 2:
        appBarTitle = 'shop'.tr;
        body = Center(
          child: Text("Page 3"),
        );
        ;
        break;

      case 3:
        appBarTitle = 'profile'.tr;
        body = ViewProfilePage();
        break;

      default:
        appBarTitle = defaultString;
        body = Center(
          child: Text("Page 1"),
        );
        break;
    }

    update(['bottom_bar', 'body', 'text_app_bar_title']);
  }
}
