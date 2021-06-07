import 'package:flutter/material.dart';
import 'package:football_trivia/ui/auth/login/login.dart';
import 'package:football_trivia/ui/home/content/home_content.dart';
import 'package:football_trivia/ui/leader_board/leader_board.dart';
import 'package:football_trivia/ui/profile/view/view_profile.dart';
import 'package:get/get.dart';

import '../../profile/view/view_profile.dart';

class HomeContainerController extends GetxController {
  late Widget body;
  late int selectedBottomBarIndex;

  @override
  void onInit() {
    body = HomeContentPage();
    selectedBottomBarIndex = 0;

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
        body = HomeContentPage();
        break;

      case 1:
        body = LeaderBoardPage();
        break;

      case 2:
        body = Center(
          child: TextButton(
            onPressed: () {
              Get.to(() => LoginPage());
            },
            child: Text("Visit Login"),
          ),
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
