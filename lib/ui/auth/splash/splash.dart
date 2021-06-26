import 'package:demo_app/constants.dart';
import 'package:demo_app/ui/auth/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPrimary,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: const BoxDecoration(
            color: colorPrimary,
          ),
          child: Center(
            child: Text(
              "Demo Application",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
