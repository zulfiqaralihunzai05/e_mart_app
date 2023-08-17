import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/consts/lists.dart';
import 'package:e_mart_app/controllers/auth_controller.dart';
import 'package:e_mart_app/controllers/profile_controller.dart';
import 'package:e_mart_app/services/firestore_services.dart';
import 'package:e_mart_app/view/auth/login_screen.dart';
import 'package:e_mart_app/view/profile_screen/components/details_card.dart';
import 'package:e_mart_app/view/profile_screen/edit_profile_screen.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      Scaffold(
          body: StreamBuilder(
        stream: FirestorServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];

            return SafeArea(
              child: Column(
                children: [
                  //  edit profile button
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.edit, color: whiteColor))
                          .onTap(() {
                        controller.nameController.text = data['name'];


                        Get.to(() => EditProfileScreen(data: data));
                      })),


                  //User Details Selection

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''

                        ? Image.asset(imgProfile2, width: 80, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                        : Image.network(data['imageUrl'], width: 80, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),

                        10.widthBox,

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .white
                                  .make(),
                              "${data['email']}".text.white.make(),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                            color: whiteColor,
                          )),
                          onPressed: () async {
                            await Get.put(AuthController())
                                .signoutMethod(context);
                            Get.offAll(() => LoginScreen());
                          },
                          child: logout.text.fontFamily(semibold).white.make(),
                        )
                      ],
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                          count: data['cart_count'],
                          title: "in your cart",
                          width: context.screenWidth / 3.6),
                      detailsCard(
                        count: data['wishlist_count'],
                        title: "Wishlist",
                        width: context.screenWidth / 3.6,
                      ),
                      detailsCard(
                          count: data['order_count'],
                          title: "your order",
                          width: context.screenWidth / 3.6),
                    ],
                  ),

                  //button Section

                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonIcon[index],
                          width: 20,
                        ),
                        title: profileButtonList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                  )
                      .box
                      .white
                      .rounded
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .margin(EdgeInsets.all(12))
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make()
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
