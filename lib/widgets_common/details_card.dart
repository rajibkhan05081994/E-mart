import 'package:e_mart/consts/consts.dart';


Widget DetailsCard({width,String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  ).box.white.width(width).rounded.height(80).padding(EdgeInsets.all(4)).make();
}