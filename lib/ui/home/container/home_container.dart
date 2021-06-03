import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/home/container/home_container_controller.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class HomeContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal,
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: GetBuilder<HomeContainerController>(
            id: "text_app_bar_title",
            init: HomeContainerController(),
            builder: (viewController) {
              return Text(
                viewController.appBarTitle,
                style: textStyleAppBar,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              );
            },
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: null,
        bottomNavigationBar: buildBottomBar(),
        body: GetBuilder<HomeContainerController>(
          id: 'body',
          init: HomeContainerController(),
          builder: (controller) {
            return SafeArea(
              child: controller.body,
            );
          },
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return GetBuilder<HomeContainerController>(
      id: 'bottom_bar',
      init: HomeContainerController(),
      builder: (HomeContainerController viewController) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(
              const Radius.circular(34.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              const Radius.circular(34.0),
            ),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              currentIndex: viewController.selectedBottomBarIndex,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: textStyleBottomBar,
              unselectedLabelStyle: textStyleBottomBar,
              selectedItemColor: colorAccent,
              unselectedItemColor: colorDisabled,
              items: [
                getBottomBarItem(
                  viewController,
                  'images/ic_home.png',
                  'home'.tr,
                  0,
                ),
                getBottomBarItem(
                  viewController,
                  'images/ic_leader_board.png',
                  'leader_board'.tr,
                  1,
                ),
                getBottomBarItem(
                  viewController,
                  'images/ic_shop.png',
                  'shop'.tr,
                  2,
                ),
                getBottomBarItem(
                  viewController,
                  'images/ic_profile.png',
                  'profile'.tr,
                  3,
                ),
              ],
              onTap: (index) {
                viewController.changeBottomBarIndex(index);
              },
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem getBottomBarItem(
    HomeContainerController viewController,
    String imagePath,
    String title,
    int position,
  ) {
    return BottomNavigationBarItem(
      icon: imagePath.trim().isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(
                bottom: 0.0,
              ),
              child: (position == viewController.selectedBottomBarIndex
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.fitHeight,
                      height: 32.0,
                      color: colorAccent,
                    )
                  : Image.asset(
                      imagePath,
                      fit: BoxFit.fitHeight,
                      height: 32.0,
                      color: colorDisabled,
                    )),
            )
          : SizedBox(height: 32.0),
      label: title,
    );
  }
}
