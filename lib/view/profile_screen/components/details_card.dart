import 'package:e_mart_app/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}){
  return     Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],

  ).box.white.roundedSM.width(width).height(70).padding(EdgeInsets.all(4)).make();

}