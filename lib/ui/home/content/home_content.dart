import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:football_trivia/base/widget/central_progress_indicator.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/home/content/home_content_controller.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class HomeContentPage extends StatelessWidget {
  final itemSizeSingle = 40.0;
  final itemSizeDouble = 65.0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<HomeContentController>(
          id: "body",
          init: HomeContentController(),
          builder: (viewController) {
            if (viewController.isLoading) {
              return CentralProgressIndicator();
            } else {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildIntroductionSection(),
                    buildBanner(),
                    buildListHeader(),
                    buildList(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Container buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_home_banner.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Start Quiz",
            style: textStyleRegular.copyWith(
              fontSize: 18.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Play and test your multiple choice answering skills for your favorite sport.",
            style: textStyleRegular.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
              color: Colors.white,
              height: 1.53,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ).marginOnly(top: 6.0, bottom: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
            ),
            child: Text(
              "Play Now",
              style: textStyleRegular.copyWith(
                color: colorAccent,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIntroductionSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "images/ic_hey.png",
                    fit: BoxFit.fitHeight,
                    height: 16.0,
                  ).marginOnly(right: 8.0),
                  Text(
                    "Hey",
                    style: textStyleRegular.copyWith(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ).marginOnly(bottom: 6.0),
              Text(
                "Great to see you!",
                style: textStyleFocused.copyWith(
                  color: colorTextRegular,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
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
            horizontal: 12.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
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
                style: textStyleRegular,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              const Radius.circular(18.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
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
                style: textStyleRegular,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ).marginOnly(
      left: 22.0,
      right: 22.0,
      top: 8.0,
    );
  }

  Expanded buildList() {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return buildItem(index);
        },
        separatorBuilder: (
          BuildContext context,
          int index,
        ) {
          return SizedBox(height: 12.0);
        },
        itemCount: 3,
      ),
    );
  }

  Widget buildListHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Top 3 Scorer",
          style: textStyleRegular.copyWith(
            fontSize: 18.0,
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ).marginSymmetric(horizontal: 22.0),
        Row(
          children: [
            Expanded(
              child: Text(
                "Name",
                style: textStyleRegular,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: itemSizeSingle,
              child: Text(
                "Lvl",
                style: textStyleRegular,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: itemSizeDouble,
              child: Text(
                "Answers",
                style: textStyleRegular,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ).marginSymmetric(horizontal: 8.0),
            SizedBox(
              width: itemSizeDouble,
              child: Text(
                "Correct",
                style: textStyleRegular,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 24.0).marginSymmetric(vertical: 16.0),
      ],
    );
  }

  Widget buildItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
                ),
                radius: 20.0,
              ),
              Container(
                width: 16.0,
                height: 16.0,
                decoration: const BoxDecoration(
                  color: colorAccent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: textStyleSmall.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doris Fox",
                  style: textStyleRegular,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).marginOnly(bottom: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/United-kingdom_flag_icon_round.svg/1200px-United-kingdom_flag_icon_round.svg.png",
                      ),
                      radius: 8.0,
                    ),
                    Text(
                      "United Kingdom",
                      style: textStyleBottomBarItem.copyWith(
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ).marginOnly(left: 8.0),
                  ],
                ),
              ],
            ).marginSymmetric(horizontal: 12.0),
          ),
          SizedBox(
            width: itemSizeSingle,
            child: Text(
              "10",
              style: textStyleRegular.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: itemSizeDouble,
            child: Text(
              "17/30",
              style: textStyleRegular.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ).marginSymmetric(horizontal: 8.0),
          SizedBox(
            width: itemSizeDouble,
            child: Text(
              "18",
              style: textStyleRegular.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
