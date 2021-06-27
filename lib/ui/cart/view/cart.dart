import 'package:demo_app/base/widget/central_empty_list_placeholder.dart';
import 'package:demo_app/base/widget/central_progress_indicator.dart';
import 'package:demo_app/constants.dart';
import 'package:demo_app/ui/cart/view/cart_controller.dart';
import 'package:demo_app/ui/home/container/home_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CartPage extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<CartPageController>(
          id: "body",
          init: CartPageController(),
          builder: (viewController) {
            if (viewController.isLoading) {
              return CentralProgressIndicator();
            } else {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildInformationSection(),
                    buildTitleSection(),
                    buildItemList(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildInformationSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/ic_shop.png",
            fit: BoxFit.fitHeight,
            height: 28.0,
          ).marginOnly(right: 8.0),
          Expanded(
            child: Text(
              "Cart",
              style: textStyleExtraLarge.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Container buildTitleSection() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Items",
            style: textStyleExtraExtraLarge,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).marginOnly(bottom: 4.0),
          Text(
            "Here you see the items you have added",
            style: textStyleExtraLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: colorTextSecondary,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Expanded buildItemList() {
    return Expanded(
      child: GetX<HomeContainerController>(
        builder: (viewController) {
          if (viewController.cartCount.value < 1) {
            return CentralEmptyListPlaceholder();
          } else {
            return StaggeredGridView.countBuilder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              crossAxisCount: 2,
              itemCount: viewController.cartCount.value,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return buildItem(index);
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.fit(1);
              },
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
            );
          }
        },
      ),
    );
  }

  Widget buildItem(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            const Radius.circular(12.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "images/ic_coin.png",
              height: 32.0,
              fit: BoxFit.fitHeight,
            ),
            Text(
              "Buy 100 Coins",
              style: textStyleLarge,
              textAlign: TextAlign.start,
            ).marginSymmetric(vertical: 10.0),
            Text(
              "\$1.99",
              style: textStyleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: colorAccent,
              ),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
