import 'dart:io';

import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/controller/profile_controller.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/custom_textfield.dart';
import 'package:e_mart/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget{
  final dynamic data;
  const EditProfileScreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Obx(
            ()=> Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data['imageUrl']== '' && controller.profileimgPath.isEmpty?
                Image.asset(imgProfile2,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                :data['imageUrl'] != '' && controller.profileimgPath.isEmpty?
                    Image.network(
                      data['imageUrl'],
                      width: 100,
                      fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                  File(controller.profileimgPath.value),
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(color: redColor,title: "change", textColor: whiteColor,onPress: (){
                  controller.changeImage(context);
                }),
                const Divider(),
                20.heightBox,
                customTextfield(hint: nameHint,title: name,isPass: false,controller: controller.nameController),
                10.heightBox,
                customTextfield(hint: passwordHint,title: oldpass,isPass: true,controller: controller.oldpasswordController),
                10.heightBox,
                customTextfield(hint: passwordHint,title: newpass,isPass: true,controller: controller.newpasswordController),
                20.heightBox,
                controller.isLoading.value? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    redColor
                  ),
                ):SizedBox(
                  width: context.screenWidth-60,
                    child: ourButton(
                      color: redColor,
                      title: "Save",
                      textColor: whiteColor,
                      onPress: () async {
                      controller.isLoading(true);
                      //if image is not selected
                      if(controller.profileimgPath.value.isNotEmpty){
                        await controller.uploadProfileImage();
                      }else{
                        controller.profileimgLink = data['imageUrl'];
                      }
                      //if old pass matches then new pass works
                      if(data['password'] == controller.oldpasswordController.text){
                        await controller.changeAuthPassword(
                          email: data['email'],
                          password: controller.oldpasswordController.text,
                          newPassword: controller.newpasswordController.text);
                        await controller.updateDocument(
                            imgurl: controller.profileimgLink,
                            name: controller.nameController.text,
                            password: controller.newpasswordController.text
                        );
                        VxToast.show(context, msg: "Updated");
                      }else{
                        VxToast.show(context, msg: "Wrong old password");
                        controller.isLoading(false);
                      }
                    },
                    )),
              ],
            ).box.rounded.shadowSm.white.padding(EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50,left: 12,right: 12)).make(),
          ),
        ),
      ),
    );
  }
}
