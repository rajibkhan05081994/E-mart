import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/controller/product_controller.dart';
import 'package:e_mart/views/category_screen/item_details.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:get/get.dart';


class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                           controller.subcat.length,
                          (index) => "${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .size(120, 60)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make(),

                  ),
                ),
              ),
              20.heightBox,
              Expanded(
                  child: Container(
                          color: lightGrey,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP1,height: 150,width: 200,fit: BoxFit.cover),
                            10.heightBox,
                            "Laptop 4GB/64GB RAM".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                          ],
                        )
                            .box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(EdgeInsets.all(8)).make().onTap(() {
                             Get.to(()=>ItemDetails(title: "Dummy title"));
                        });
                      }),
                  ),
              ),
            ],
          ),


        ),
      ),
    );
  }
}
