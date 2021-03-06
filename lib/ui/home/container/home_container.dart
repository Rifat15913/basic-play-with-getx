import 'package:demo_app/constants.dart';
import 'package:demo_app/ui/home/container/home_container_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class HomeContainerPage extends GetView<HomeContainerController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal,
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: buildBottomBar(),
        body: GetBuilder<HomeContainerController>(
          id: 'body',
          builder: (controller) {
            return controller.body;
          },
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return GetBuilder<HomeContainerController>(
      id: 'bottom_bar',
      builder: (HomeContainerController viewController) {
        return Container(
          margin: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
            top: 8.0,
          ),
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
              selectedLabelStyle: textStyleBottomBarItem,
              unselectedLabelStyle: textStyleBottomBarItem,
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
                  'images/ic_shop.png',
                  "Cart",
                  1,
                  hasBatch: true,
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
    int position, {
    bool hasBatch = false,
  }) {
    return BottomNavigationBarItem(
      icon: imagePath.trim().isNotEmpty
          ? Stack(
              alignment: Alignment.topRight,
              children: [
                (position == viewController.selectedBottomBarIndex
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
                if (hasBatch)
                  Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (position == viewController.selectedBottomBarIndex)
                          ? colorAccent
                          : colorDisabled,
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${viewController.cartCount.value}",
                          style: textStyleSmall.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : SizedBox(height: 32.0),
      label: title,
    );
  }
}
