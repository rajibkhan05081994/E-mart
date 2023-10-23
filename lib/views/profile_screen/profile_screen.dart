import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controller/auth_controller.dart';
import 'package:e_mart/controller/profile_controller.dart';
import 'package:e_mart/services/firestore+services.dart';
import 'package:e_mart/views/auth_screen/login_screen.dart';
import 'package:e_mart/views/profile_screen/edit_profile_screen.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/details_card.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(user!.uid),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
            }else{
              var data = snapshot.data!.docs[0];
              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit,color: whiteColor)).onTap(() {
                        controller.nameController.text = data['name'];
                        // controller.passwordController.text = data['password'];
                        Get.to(()=> EditProfileScreen(data: data));
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          data['imageUrl'] == ''?
                          Image.asset(imgProfile2,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.network(data['imageUrl'],width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}".text.white.fontFamily(semibold).make(),
                              "${data['email']}".text.white.make(),
                            ],
                          )),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: whiteColor,
                                )
                            ),
                            onPressed: () async {
                              await Get.put(AuthController()).signOutMethod(context);
                              Get.offAll(()=> const LoginScreen());
                            },
                            child: logout.text.white.fontFamily(semibold).size(16).make(),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsCard(count: data['cart_count'],width: context.screenWidth/3.4,title: "In your Cart"),
                        DetailsCard(count: data['wishlist_count'],width: context.screenWidth/3.4,title: "In your Wishlist"),
                        DetailsCard(count: data['order_count'],width: context.screenWidth/3.4,title: "Your Orders"),
                      ],
                    ),
                    // button section
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context,index){
                        return const Divider(
                          color: lightGrey,
                        );
                      },
                      itemCount: profileButtonlist.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          leading: Image.asset(
                            profileButtonIcons[index],
                            width: 22,
                          ),
                          title: profileButtonlist[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                        );
                      },
                    ).box.white.margin(EdgeInsets.all(12)).rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
                  ],
                ),
              );
            }
          },
        )
      ),
    );
  }
}
