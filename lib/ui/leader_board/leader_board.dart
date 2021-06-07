import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:football_trivia/base/widget/central_progress_indicator.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/leader_board/leader_board_controller.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class LeaderBoardPage extends StatelessWidget {
  final itemSizeSingle = 40.0;
  final itemSizeDouble = 65.0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<LeaderBoardController>(
          id: "body",
          init: LeaderBoardController(),
          builder: (viewController) {
            if (viewController.isLoading) {
              return CentralProgressIndicator();
            } else {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 270.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "images/ic_background_leader_board.png",
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Name",
                                style: textStyleRegular.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: itemSizeSingle,
                              child: Text(
                                "Lvl",
                                style: textStyleRegular.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: itemSizeDouble,
                              child: Text(
                                "Answers",
                                style: textStyleRegular.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ).marginSymmetric(horizontal: 8.0),
                            SizedBox(
                              width: itemSizeDouble,
                              child: Text(
                                "Correct",
                                style: textStyleRegular.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                            .paddingSymmetric(horizontal: 24.0)
                            .marginSymmetric(vertical: 16.0),
                        Expanded(
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
                            itemCount: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
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
