import 'package:demo_app/base/widget/central_progress_indicator.dart';
import 'package:demo_app/base/widget/custom_filled_button.dart';
import 'package:demo_app/constants.dart';
import 'package:demo_app/ui/quiz/view/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../constants.dart';

class ViewQuizPage extends StatelessWidget {
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
        body: GetBuilder<ViewQuizController>(
          id: "body",
          init: ViewQuizController(),
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
                    buildQuestionCountSection(),
                    buildAnswerItems(),
                    buildButtonSection(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Container buildQuestionCountSection() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Question 06",
                style: textStyleRegular.copyWith(
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "/",
                style: textStyleRegular,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "20",
                style: textStyleRegular.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorTextSecondary,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ).marginOnly(bottom: 12.0),
          GetBuilder<ViewQuizController>(
            id: "question_count_section",
            init: ViewQuizController(),
            builder: (viewController) {
              return buildQuestionIndicators();
            },
          ),
        ],
      ),
    );
  }

  Widget buildQuestionIndicators() {
    List<Widget> children = [];

    final itemWidth = (Get.width - (20.0 * 2) - (4.0 * 19)) / 20;

    for (int i = 0; i < 20; i++) {
      children.add(
        Container(
          margin: i < 19
              ? const EdgeInsets.only(right: 4.0)
              : const EdgeInsets.all(0.0),
          width: itemWidth,
          height: 2.0,
          color: i % 4 == 0 ? colorAccent : colorDisabled.withOpacity(0.15),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Expanded buildAnswerItems() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            const Radius.circular(12.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(12.0),
                ),
                child: Image.network(
                  "https://images.unsplash.com/photo-1510051640316-cee39563ddab?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vdGJhbGwlMjBuZXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
                  fit: BoxFit.cover,
                  height: 170.0,
                  width: double.maxFinite,
                ),
              ).marginOnly(bottom: 16.0),
              GestureDetector(
                onTap: () {
                  showHintPopUp();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: colorTextWarning.withOpacity(0.17),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outlined,
                        color: colorTextWarning,
                        size: 16.0,
                      ).marginOnly(right: 8.0),
                      Text(
                        "Hint",
                        style: textStyleRegular.copyWith(
                          color: colorTextWarning,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "1. The penalty area is usually how far away from the touch line?",
                style: textStyleFocused.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ).marginOnly(bottom: 12.0),
              GetBuilder<ViewQuizController>(
                id: "list_view_answer_items",
                init: ViewQuizController(),
                builder: (viewController) {
                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                    itemCount: 4,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonSection() {
    return Row(
      children: [
        Expanded(
          child: CustomFilledButton(
            title: "Quit Quiz",
            onTap: () {
              Get.back();
            },
            backgroundColor: Colors.white,
            textColor: colorTextRegular,
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
          ),
        ),
        SizedBox(width: 0.0),
        Expanded(
          child: GetBuilder<ViewQuizController>(
            init: ViewQuizController(),
            builder: (viewController) {
              return CustomFilledButton(
                title: "Next",
                onTap: () {
                  /*if (viewController.currentQuestionIndex < 20 - 1) {
                    viewController.changeQuestionIndex(
                      viewController.currentQuestionIndex + 1,
                    );
                  }*/
                  showResultPopUp();
                },
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
              );
            },
          ),
        ),
      ],
    ).marginSymmetric(
      horizontal: 8.0,
      vertical: 16.0,
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

  Widget buildItem(int index) {
    return GetBuilder<ViewQuizController>(
      init: ViewQuizController(),
      builder: (viewController) {
        bool isSelected = (viewController.selectedIndex != null &&
            viewController.selectedIndex == index);

        return GestureDetector(
          onTap: () {
            viewController.selectItem(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorAccent.withOpacity(0.15)
                  : colorPageBackground,
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            child: Text(
              "18 Yards",
              style: textStyleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected ? colorAccent : colorTextRegular,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              //maxLines: 3,
            ),
          ),
        );
      },
    );
  }

  void showHintPopUp() {
    Get.defaultDialog(
      title: "",
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/ic_gem.png",
                            height: 32.0,
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            "20\n" + "Gems",
                            style: textStyleRegular.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "images/ic_coin.png",
                            height: 32.0,
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            "100\n" + "Coins",
                            style: textStyleRegular.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ).marginOnly(
                    bottom: 32.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  Text(
                    "Wait",
                    style: textStyleExtraExtraLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Skip 2 choices so you can guess easily!",
                    style: textStyleExtraLarge.copyWith(
                      color: colorTextSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ).marginOnly(
                    bottom: 16.0,
                    top: 12.0,
                  ),
                ],
              ),
            ),
            CustomFilledButton(
              title: "Watch a video",
              onTap: () {},
            ),
            CustomFilledButton(
              title: "Use Coins",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Use Coins",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "Product Sans",
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  Image.asset(
                    "images/ic_coin.png",
                    fit: BoxFit.fitHeight,
                    height: 20.0,
                  ).marginOnly(
                    left: 24.0,
                    right: 12.0,
                  ),
                  Text(
                    "4",
                    style: textStyleFocused.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              backgroundColor: colorCoin,
              onTap: () {},
            ),
            CustomFilledButton(
              title: "Use Gems",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Use Gems",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "Product Sans",
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  Image.asset(
                    "images/ic_gem.png",
                    fit: BoxFit.fitHeight,
                    height: 20.0,
                  ).marginOnly(
                    left: 24.0,
                    right: 12.0,
                  ),
                  Text(
                    "1",
                    style: textStyleFocused.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              backgroundColor: colorGem,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void showResultPopUp() {
    Get.defaultDialog(
      title: "",
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  Text(
                    "You are awesome!",
                    style: textStyleExtraExtraLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Congratulations for getting all the answers correct!",
                    style: textStyleExtraLarge.copyWith(
                      color: colorTextSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ).marginOnly(
                    top: 12.0,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircularPercentIndicator(
                          radius: 175.0,
                          animation: false,
                          lineWidth: 8.0,
                          percent: 1.0,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "100%",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40.0,
                                  color: colorDisabled,
                                ),
                              ),
                              Text(
                                "20 of 20",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: colorDisabled.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: colorAccent,
                          progressColor: colorAccent,
                        ).marginOnly(top: 18.0),
                        Image.asset(
                          "images/ic_done_circle.png",
                          fit: BoxFit.fitHeight,
                          height: 48.0,
                        ),
                      ],
                    ),
                  ).marginSymmetric(vertical: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: buildStatisticsItem(
                          "Correct",
                          "10",
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: buildStatisticsItem(
                          "Wrong",
                          "0",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomFilledButton(
              title: "Share it",
              onTap: () {},
            ),
          ],
        ),
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
}
