import 'package:flutter/material.dart';
import 'package:football_trivia/ui/leader_board/leader_board.dart';
import 'package:football_trivia/ui/profile/view/view_profile.dart';
import 'package:get/get.dart';

import '../../profile/view/view_profile.dart';

class HomeContainerController extends GetxController {
  late Widget body;
  late int selectedBottomBarIndex;

  @override
  void onInit() {
    body = ViewProfilePage();
    selectedBottomBarIndex = 3;

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
        body = Center(
          child: Text("Page 1"),
        );
        break;

      case 1:
        body = LeaderBoardPage();
        break;

      case 2:
        body = Center(
          child: Text("Page 3"),
        );
        break;

      case 3:
        body = ViewProfilePage();
        break;

      default:
        body = Center(
          child: Text("Page 1"),
        );
        break;
    }

    update(['bottom_bar', 'body', 'text_app_bar_title']);
  }
}
