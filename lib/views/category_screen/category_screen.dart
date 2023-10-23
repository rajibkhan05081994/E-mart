import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controller/product_controller.dart';
import 'package:e_mart/views/category_screen/category_details.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200),
              itemBuilder: (context,index){
                return Column(
                  children: [
                        Image.asset(categoryImag[index],height: 120,width: 200,fit: BoxFit.cover,),
                    10.heightBox,
                    categoryLists[index].text.color(darkFontGrey).align(TextAlign.center).make(),
                  ],
                ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() { 
                  controller.getSubCategories(categoryLists[index]);
                  Get.to(()=>CategoryDetails(title: categoryLists[index]));
                });
              }),
        ),
      )
    );
  }
}
