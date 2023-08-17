import 'dart:io';
import 'package:e_mart_app/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;


  var nameController = TextEditingController();
  var passController = TextEditingController();

  var profileImageLink = '';

  var isloading = false.obs;

  changeImage(context) async {
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      //File profileImgPath = File(img.toString());
      if(img == null) return;
      profileImgPath.value = img.path;
    }on PlatformException catch (e){
      VxToast.show(context, msg: e.toString());

    }
  }
  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  uploadProfile({name, password, imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.update({'name' : name, 'password' : password, 'imageUrl' : imgUrl,});
    isloading(false);
  }

}