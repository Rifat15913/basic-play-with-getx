import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// Default values
const bool defaultBoolean = false;
const int defaultInt = 0;
const double defaultDouble = 0.0;
const String defaultString = "";
const String spaceString = " ";
const String newLineString = "\n";

// App colors (main)
const Color colorPrimary = const Color(0xFF258633);
const Color colorAccent = const Color(0xFF258633);
const Color colorHighlight = const Color(0xFFFFA100);
const Color colorDisabled = const Color(0xD1272B37);
const Color colorGem = const Color(0xFF1388C9);
const Color colorCoin = const Color(0xFFFAB43D);

// App colors (text)
const Color colorTextRegular = const Color(0xFF272B37);
const Color colorTextSecondary = const Color(0xFF707586);
const Color colorTextTertiary = const Color(0xFF6B7285);
const Color colorTextWarning = const Color(0xFFFF5E00);

// App colors (others)
const Color colorInputFieldBackground = const Color(0xFFFAFAFA);
const Color colorInputFieldBorder = const Color(0xFFF3F2F2);
const Color colorPageBackground = const Color(0xFFF4F5F7);
const Color colorCloseButtonBackground = const Color(0x12707586);

const Color colorItemInactiveBackground = const Color(0xFFEBF2FE);
const Color colorItemActiveBackground = const Color(0xFF3580F7);
const Color colorExamItemInactiveBackground = const Color(0xFFF5F6FC);
const Color colorExamItemActiveBackground = const Color(0xFF3580F7);
const Color colorUserActive = const Color(0xFF00D563);
const Color colorWinningTeamBackground = const Color(0xFF6CE6E1);
const Color colorWinProgress = const Color(0xFF27AE60);
const Color colorLoseProgress = const Color(0xFFEB5757);
const Color colorTieProgress = colorAccent;
const Color colorSkipProgress = colorWinningTeamBackground;
const Color colorOrange = const Color(0xFFF2994A);

// Text styles
const TextStyle textStyleBottomBarItem = const TextStyle(
  color: colorDisabled,
  fontSize: 14.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleSectionTitle = const TextStyle(
  color: colorTextRegular,
  fontSize: 18.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleSectionItemTitle = const TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleSectionItemBody = const TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleAppBar = const TextStyle(
  color: colorTextRegular,
  fontSize: 20.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w600,
);

const TextStyle textStyleFocused = const TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleLarge = const TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleRegular = const TextStyle(
  color: colorTextRegular,
  fontSize: 14.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleSmall = const TextStyle(
  color: colorTextRegular,
  fontSize: 12.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleHeadline = const TextStyle(
  color: colorTextRegular,
  fontSize: 26.0,
  fontFamily: "Product Sans",
  fontWeight: FontWeight.w700,
);

// Input Decoration
const InputDecoration inputDecorationForm = const InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
  //hintStyle: textStyleInputFormHint,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  border: InputBorder.none,
);

// Box Decoration
const BoxDecoration boxDecorationBorderForm = const BoxDecoration(
  color: colorInputFieldBackground,
  borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
  border: const Border.fromBorderSide(
    const BorderSide(color: colorInputFieldBorder),
  ),
);

const BoxDecoration boxDecorationSectionCardBackground = const BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(
    const Radius.circular(20.0),
  ),
);

const BoxDecoration boxDecorationBackButtonBorder = const BoxDecoration(
  borderRadius: const BorderRadius.all(
    const Radius.circular(10.0),
  ),
  border: const Border.fromBorderSide(
    const BorderSide(color: colorTextSecondary),
  ),
);

// Shape
const RoundedRectangleBorder shapeButtonRectangle =
    const RoundedRectangleBorder(
  borderRadius: const BorderRadius.all(
    const Radius.circular(10.0),
  ),
);

const RoundedRectangleBorder shapeCardItemRectangle =
    const RoundedRectangleBorder(
  borderRadius: const BorderRadius.all(
    const Radius.circular(16.0),
  ),
);

// Service
const SystemUiOverlayStyle systemUiOverlayStyleGlobal =
    const SystemUiOverlayStyle(
  systemNavigationBarColor: colorPageBackground,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
);

// App essentials
const String responseOfJsonType = "application/json";
const int minimumPasswordLength = 8;
const int minimumVerificationCodeLength = 4;
const String prefixAuthToken = "Bearer ";

// Backend
const String baseDevelopmentUrl = "";
const String baseLiveUrl = "";
const String baseUrl = baseDevelopmentUrl;

const String baseAppDevelopmentUrl = "";
const String baseAppLiveUrl = "";
const String baseAppUrl = baseAppDevelopmentUrl;

final String baseApiUrl = join(baseAppUrl, "api");
final String loginUrl = join(baseApiUrl, "login");
final String surveyUrl = join(baseApiUrl, "survey");

// Key
const String keySuccess = "success";
const String keyData = "data";
const String keyMessage = "message";
const String keyEmail = "email";
const String keyPassword = "password";
const String keyToken = "token";
const String keyAuthToken = "auth_token";
const String keyTrainingCategories = "training_categories";
const String keyTimeLengths = "time_lengths";
const String keyProfessions = "professions";
const String keyCategoryIconUrl = "cat_icon_url";
const String keySubmittedPreferences = "submitted_preferences";
const String keyTrainingCategory = "training_category";
const String keyTimeLength = "time_length";
const String keyProfession = "profession";
const String keyVerificationCode = "verification_code";
const String keyUserType = "user_type";
const String keyUserPreferences = "user_preferences";
const String keyExam = "exam";

// Regular Expression
const String regularExpressionEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String regularExpressionPhone =
    "(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?" +
        "([0-9][0-9\\- \\.]+[0-9])";
