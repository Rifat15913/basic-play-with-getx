import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:football_trivia/base/widget/central_progress_indicator.dart';
import 'package:football_trivia/base/widget/custom_filled_button.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/quiz/view/quiz_controller.dart';
import 'package:get/get.dart';

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
              Container(
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
            onTap: () {},
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
                  if (viewController.currentQuestionIndex < 20 - 1) {
                    viewController.changeQuestionIndex(
                      viewController.currentQuestionIndex + 1,
                    );
                  }
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
}
