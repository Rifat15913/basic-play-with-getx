import 'package:demo_app/base/widget/custom_filled_button.dart';
import 'package:demo_app/constants.dart';
import 'package:demo_app/ui/home/container/home_container_controller.dart';
import 'package:demo_app/ui/leaf/leaf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeafPage extends GetView<LeafController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeafController>(
      id: "body",
      builder: (viewController) {
        return AnnotatedRegion(
          value: systemUiOverlayStyleGlobal.copyWith(
            systemNavigationBarColor: Colors.white,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 28.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorCloseButtonBackground,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Glad to see you!",
                              style: textStyleHeadline,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ).marginOnly(top: 16.0, bottom: 8.0),
                            Text(
                              "Tap the button below to add item to the cart!",
                              style: textStyleLarge.copyWith(
                                color: colorTextSecondary,
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      CustomFilledButton(
                        title: "Add to Cart",
                        onTap: () {
                          Get.find<HomeContainerController>().addToCart();
                        },
                        margin: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 40.0,
                          bottom: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
