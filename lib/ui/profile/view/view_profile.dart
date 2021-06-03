import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/profile/view/view_profile_controller.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../constants.dart';

class ViewProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<ViewProfileController>(
          init: ViewProfileController(),
          builder: (viewController) {
            return viewController.isLoading
                ? centralProgressIndicator
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: buildMainBody(),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget buildMainBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildInformationSection(),
              buildCreditSection(),
            ],
          ),
          buildStatisticsSection(),
          buildRankSection(),
        ],
      ),
    );
  }

  Container buildInformationSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 38.0),
      padding: const EdgeInsets.only(
        bottom: 56.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "images/ic_background_profile_user_avatar.png",
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "images/ic_settings.png",
                      height: 24.0,
                      fit: BoxFit.fitHeight,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      "images/ic_edit.png",
                      height: 24.0,
                      fit: BoxFit.fitHeight,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: const Border.fromBorderSide(
                      const BorderSide(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
                    ),
                    radius: 40.0,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    "5",
                    style: textStyleRegular,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Text(
              "Philip Fuller",
              style: textStyleFocused.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ).marginOnly(top: 12.0, bottom: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/United-kingdom_flag_icon_round.svg/1200px-United-kingdom_flag_icon_round.svg.png",
                  ),
                  radius: 10.0,
                ),
                Text(
                  "United Kingdom",
                  style: textStyleFocused.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ).marginOnly(left: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildCreditSection() {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "images/ic_gem.png",
                  height: 32.0,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(width: 16.0),
                Text(
                  "20\n" + 'profile_gems'.tr,
                  style: textStyleFocused,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "images/ic_coin.png",
                  height: 32.0,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(width: 16.0),
                Text(
                  "100\n" + 'profile_coins'.tr,
                  style: textStyleFocused,
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

  Container buildStatisticsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile_your_statistics'.tr,
            style: textStyleSectionTitle,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Center(
            child: CircularPercentIndicator(
              radius: 130.0,
              animation: false,
              lineWidth: 16.0,
              percent: 0.2,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "20",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "/100",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: colorAccent,
              progressColor: colorHighlight,
            ),
          ).marginSymmetric(vertical: 20.0),
          Row(
            children: [
              Expanded(
                child: buildStatisticsItem(
                  'profile_earned_coins'.tr,
                  "25",
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: buildStatisticsItem(
                  'profile_correct'.tr,
                  "10",
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: buildStatisticsItem(
                  'profile_wrong'.tr,
                  "22",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildStatisticsItem(String title, String subtitle) {
    return Column(
      children: [
        Text(
          subtitle,
          style: textStyleSectionItemBody,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ).marginOnly(bottom: 4.0),
        Text(
          title,
          style: textStyleSectionItemTitle,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Container buildRankSection() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
        color: colorHighlight,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_profile_rank.png"),
        ),
      ),
      child: Row(
        children: [
          Text(
            'profile_your_rank'.tr,
            style: textStyleSectionTitle.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              "25",
              style: textStyleSectionTitle.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
