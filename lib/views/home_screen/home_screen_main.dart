import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/widgets_common/featured_button.dart';
import 'package:e_mart/widgets_common/home_buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child: 
      Column(
            children: [
              Container(
                color: lightGrey,
                height: 60,
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchAnything,
                    hintStyle: TextStyle(
                      color: textfieldGrey,
                    ),
                  ),
                ),
              ),
              20.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //swiper brands
                      VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderLists.length,
                        itemBuilder: (context, index){
                          return Image.asset(
                            sliderLists[index],
                            fit: BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).shadowSm.white.make();
                        },
                      ),
                      20.heightBox,
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                                (index) => homeButtons(
                              height: context.screenHeight*0.15,
                              width: context.screenWidth/2.5,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todaysDeal : flashSell,
                            )),
                      ),
                      //second slider
                      20.heightBox,
                      VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSliderLists.length,
                        itemBuilder: (context, index){
                          return Image.asset(
                            secondSliderLists[index],
                            fit: BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).shadowSm.white.make();
                        },
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                                (index) => homeButtons(
                              height: context.screenHeight*0.15,
                              width: context.screenWidth/3.5,
                              icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                              title: index == 0 ? topCategories : index == 1 ? brand : topSellers,
                            )),
                      ),
                      //featured categories
                      20.heightBox,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make(),
                      ),
                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                            List.generate(
                              3,
                              (index) => Column(
                              children: [
                                featuredButton(icon: featuredImages1[index], title: featuredTitles1[index]),
                                10.heightBox,
                                featuredButton(icon: featuredImages2[index], title: featuredTitles2[index]),
                              ],
                            ),
                            ).toList(),
                        ),
                      ),
                      20.heightBox,
                      //featured products
                      Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: redColor
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProducts.text.white.fontFamily(semibold).size(18).make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: List.generate(6, (index) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(imgP1,width: 150,fit: BoxFit.cover),
                                              10.heightBox,
                                              "Laptop 4GB/64GB RAM".text.fontFamily(semibold).color(darkFontGrey).make(),
                                              10.heightBox,
                                              "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                                            ],
                                  ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //third swiper
                      20.heightBox,
                      VxSwiper.builder(
                        aspectRatio: 16/9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSliderLists.length,
                        itemBuilder: (context, index){
                          return Image.asset(
                            secondSliderLists[index],
                            fit: BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).shadowSm.white.make();
                        },
                      ),
                      20.heightBox,
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300),
                          itemBuilder: (context,index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(imgP1,height:200,width: 200,fit: BoxFit.cover),
                                const Spacer(),
                                10.heightBox,
                                "Laptop 4GB/64GB RAM".text.fontFamily(semibold).color(darkFontGrey).make(),
                                10.heightBox,
                                "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                              ],
                            ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(12)).make();
                          }),
                    ],
                  ),
                ),
              ),
            ],
           ),
      ),
    );
  }
}
