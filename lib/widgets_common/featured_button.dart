import 'package:e_mart/consts/consts.dart';

Widget featuredButton({String? title, icon}){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.color(darkFontGrey).fontFamily(semibold).make(),
    ],
  ).box.width(200).white.padding(EdgeInsets.all(4)).margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.make();
}