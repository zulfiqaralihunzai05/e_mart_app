import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/consts/lists.dart';
import 'package:e_mart_app/view/profile_screen/components/details_card.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //  edit profile button
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.edit,
                      color: whiteColor,
                    )),
              ),

              //User Details Selection
              10.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(imgProfile2, width: 70, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make()
                        .onTap(() {}),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Dummy User".text.fontFamily(semibold).white.make(),
                          "customer@gmail.com".text.white.make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                        color: whiteColor,
                      )),
                      onPressed: () {},
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
                      count: "00",
                      title: "in your cart",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "32",
                      title: "in your whitelist",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "67",
                      title: "your order",
                      width: context.screenWidth / 3.4),
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
        ),
      ),
    );
  }
}
