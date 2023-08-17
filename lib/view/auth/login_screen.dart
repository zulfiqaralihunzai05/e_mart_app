import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/controllers/auth_controller.dart';
import 'package:e_mart_app/view/auth/signup_screen.dart';
import 'package:e_mart_app/widgets_common/app_logo_widget.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:e_mart_app/widgets_common/custom_textfield.dart';
import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:e_mart_app/consts/strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/lists.dart';
import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log In to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(() => Column(
                      children: [
                        customTextField(
                            hint: emailHint,
                            title: email,
                            isPass: false,
                            controller: controller.emailController),
                        customTextField(
                            hint: passwordHint,
                            title: password,
                            isPass: true,
                            controller: controller.passwordController),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make(),
                          ),
                        ),
                        5.heightBox,
                        controller.isloading.value
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                            : ourButton(
                                color: redColor,
                                title: login,
                                textColor: whiteColor,
                                onPress: () async {
                                  controller.isloading(true);
                                  await controller.loginMethod(context: context).then((value){
                                    if(value != null){
                                      VxToast.show(context, msg: loggedin);
                                      Get.offAll(() => const Home());

                                    }else{
                                      controller.isloading(false);
                                     // VxToast.show(context, msg: loggederror);
                                    }
                                  });

                                }).box.width(context.screenWidth - 50).make(),
                        5.heightBox,
                        createNewAccount.text.color(fontGrey).make(),
                        5.heightBox,
                        ourButton(
                            color: lightgolden,
                            title: signup,
                            textColor: redColor,
                            onPress: () {
                              Get.to(() => SignupScreen());
                            }).box.width(context.screenWidth - 50).make(),
                        5.heightBox,
                        loginWith.text.color(fontGrey).make(),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: lightGrey,
                                      child: Image.asset(
                                        socialIconList[index],
                                        width: 30,
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    ))
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
