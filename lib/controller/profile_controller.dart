import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileimgPath = ''.obs;
  var profileimgLink = '';
  var isLoading = false.obs;
  var nameController = TextEditingController();
  var newpasswordController = TextEditingController();
  var oldpasswordController = TextEditingController();
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileimgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileimgPath.value);
    var destination = 'images/${user!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileimgPath.value));
    profileimgLink = await ref.getDownloadURL();
  }

  updateDocument({name, password, imgurl}) {
    var store = firestore.collection(userCollections).doc(user!.uid);
    store.set({'name': name, 'password': password, 'imageUrl': imgurl},SetOptions(merge: true));
    isLoading(false);
  }

  changeAuthPassword({email,password,newPassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await user!.reauthenticateWithCredential(cred).then((value){
      user!.updatePassword(newPassword);
    }).catchError((error){
      print(error.toString());
    });
  }
}
