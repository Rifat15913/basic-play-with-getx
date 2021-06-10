import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:football_trivia/base/widget/central_progress_indicator.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/shop/view/shop_controller.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class ShopPage extends StatelessWidget {
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
        body: GetBuilder<ShopPageController>(
          id: "body",
          init: ShopPageController(),
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
                    buildPackageList(),
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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/ic_level.png",
                  fit: BoxFit.fitHeight,
                  height: 28.0,
                ).marginOnly(right: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Level",
                      style: textStyleRegular.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "5",
                      style: textStyleRegular,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            decoration: const BoxDecoration(
              color: colorGem,
              borderRadius: const BorderRadius.all(
                const Radius.circular(18.0),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  "images/ic_gem.png",
                  fit: BoxFit.fitHeight,
                  height: 16.0,
                ).marginOnly(right: 8.0),
                Text(
                  "0",
                  style: textStyleRegular.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: colorCoin,
              borderRadius: const BorderRadius.all(
                const Radius.circular(18.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Row(
              children: [
                Image.asset(
                  "images/ic_coin.png",
                  fit: BoxFit.fitHeight,
                  height: 16.0,
                ).marginOnly(right: 8.0),
                Text(
                  "0",
                  style: textStyleRegular.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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
            "Shop",
            style: textStyleExtraExtraLarge,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).marginOnly(bottom: 4.0),
          Text(
            "Shop coins or gems to skip questions you can also earn from answering questions!",
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

  Expanded buildPackageList() {
    return Expanded(
      child: GetBuilder<ShopPageController>(
        id: "list_view_shop_items",
        init: ShopPageController(),
        builder: (viewController) {
          return StaggeredGridView.countBuilder(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            crossAxisCount: 2,
            itemCount: 20,
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
