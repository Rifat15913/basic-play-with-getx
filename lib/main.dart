import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/essential/translations.dart';
import 'package:football_trivia/ui/auth/splash/splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runZonedGuarded<Future<void>>(
    () async {
      await GetStorage.init();

      runApp(MyApp());
    },
    FirebaseCrashlytics.instance.recordError,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: colorPrimary,
        accentColor: colorAccent,
        fontFamily: 'Product Sans',
      ),
      debugShowCheckedModeBanner: true,
      home: SplashScreen(),
    );
  }
}
