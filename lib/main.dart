import 'package:demo_app/constants.dart';
import 'package:demo_app/essential/translations.dart';
import 'package:demo_app/ui/auth/splash/splash.dart';
import 'package:demo_app/ui/auth/splash/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(MyApp());
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
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: SplashBinding(),
    );
  }
}
