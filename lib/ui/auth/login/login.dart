import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_trivia/base/widget/custom_filled_button.dart';
import 'package:football_trivia/base/widget/custom_text_form_field.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/ui/auth/login/login_controller.dart';
import 'package:football_trivia/ui/auth/registration/registration.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: "body",
      init: LoginController(),
      builder: (viewController) {
        return AnnotatedRegion(
          value: systemUiOverlayStyleGlobal.copyWith(
            systemNavigationBarColor: Colors.white,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 28.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorCloseButtonBackground,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Glad to see you!",
                              style: textStyleHeadline,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ).marginOnly(top: 16.0, bottom: 8.0),
                            Text(
                              "It's good to see you again. Let's start!",
                              style: textStyleLarge.copyWith(
                                color: colorTextSecondary,
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      CustomTextFormField(
                        formController: viewController.emailController,
                        inputType: TextInputType.emailAddress,
                        hint: "Email address",
                        iconPath: "images/ic_email.png",
                      ),
                      CustomTextFormField(
                        formController: viewController.passwordController,
                        inputType: TextInputType.visiblePassword,
                        hint: "Password",
                        iconPath: "images/ic_lock.png",
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        width: double.maxFinite,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            textAlign: TextAlign.end,
                            style: textStyleLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorHighlight,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          CustomFilledButton(
                            title: "Log In",
                            onTap: () {},
                            margin: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 40.0,
                              bottom: 16.0,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: textStyleRegular,
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => RegistrationPage());
                                    },
                                  text: "Sign Up",
                                  style: textStyleRegular.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
