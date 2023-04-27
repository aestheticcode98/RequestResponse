import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reqres/pages/add_user/adduser_api.dart';

class AddUserController extends GetxController{
  final AddUserApi api;
  AddUserController({required this.api});

  var edtname = TextEditingController();
  var edtjob = TextEditingController();
  final formkeyNewUser = GlobalKey<FormState>();
  var successStatus = false.obs;

  var user_id = 0.obs;
  var user_name = "".obs;
  var user_job = "".obs;

  @override
  void onClose() {
   super.onClose();
   edtjob.dispose();
   edtname.dispose();
  }

  validator(){
    if(formkeyNewUser.currentState!.validate()){
      if(edtname.text.isNotEmpty && edtjob.text.isNotEmpty){
        newUserResponse();
      }else{
        Get.snackbar(
            "Input",
            "Please check the input",
          snackPosition: SnackPosition.BOTTOM
        );
      }
    }
  }

  newUserResponse()async{
    try{
      var addUserResponse = await api.newUser(
          name: edtname.text,
          job: edtjob.text
      );

      if(addUserResponse != null){
        successStatus.value = true;
        user_id.value = int.parse(addUserResponse["id"]);
        user_name.value = addUserResponse["name"];
        user_job.value = addUserResponse["job"];
      }else{
        successStatus.value = false;
      }
    }catch(e){
      log(e.toString());
    }
  }
}