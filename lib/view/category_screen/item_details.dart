import 'package:e_mart_app/consts/colors.dart';
import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/consts/lists.dart';
import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

import '../../consts/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 19 / 9,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make()
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    // color selection
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color:".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .make()),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        //quality row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity:".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        //total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total:".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                "\$0.00"
                                    .text
                                    .color(redColor)
                                    .size(16)
                                    .fontFamily(bold)
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                    //description selection
                    10.heightBox,
                    "Description "
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "This is a dummy item and dummy description here.. "
                        .text
                        .color(darkFontGrey)
                        .make(),

                    // button section
                    10.heightBox,

                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonsList.length,
                          (index) => ListTile(
                                title: "${itemDetailsButtonsList[index]}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward),
                              )),
                    ),

                    //product you may like
                    20.heightBox,
                    productyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),

                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                                (index) => Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "Laptop 4GB/64GB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "\$600"
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                              ],
                            )
                                .box
                                .white
                                .margin(
                                EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .padding(EdgeInsets.all(8))
                                .make()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          10.heightBox,
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to Cart"),
          )
        ],
      ),
    );
  }
}
