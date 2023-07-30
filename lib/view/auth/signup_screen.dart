import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../consts/lists.dart';
import '../../consts/strings.dart';
import '../../widgets_common/app_logo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Column(
              children: [
                customTextField(hint: nameHint, title: name),
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: password),
                customTextField(hint: passwordHint, title: retypePassword),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: whiteColor,
                        activeColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });

                        }),
                    10.heightBox,
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style:
                                TextStyle(fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: termAndCond,
                            style:
                                TextStyle(fontFamily: regular, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style:
                                TextStyle(fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(fontFamily: regular, color: redColor))
                      ])),
                    )
                  ],
                ),
                ourButton(
                        color:isCheck == true? redColor: lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text.color(redColor).make().onTap(() {
                      Get.back();
                    })
                  ],
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadow
                .make(),
          ],
        ),
      ),
    ));
  }
}