import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reqres/pages/edit_user/edituser_api.dart';

class EditUserController extends GetxController{
  final EditUserApi api;
  EditUserController({required this.api});

  var edtname = TextEditingController();
  var edtjob = TextEditingController();
  final formkeyEditUser = GlobalKey<FormState>();
  var successStatus = false.obs;

  var user_id = 0.obs;
  var user_name = "".obs;
  var user_job = "".obs;


  @override
  void onInit() {
    super.onInit();
    user_id.value = Get.arguments;
  }

  @override
  void onClose() {
    super.onClose();
    edtjob.dispose();
    edtname.dispose();
  }

  validator(){
    if(formkeyEditUser.currentState!.validate()){
      if(edtname.text.isNotEmpty && edtjob.text.isNotEmpty){
        editUserResponse();
      }else{
        Get.snackbar(
            "Input",
            "Please check the input",
            snackPosition: SnackPosition.BOTTOM
        );
      }
    }
  }

  editUserResponse()async{
    try{
      var editResponse = await api.editUser(
          id: user_id.value,
          name: edtname.text,
          job: edtjob.text
      );
      if(editResponse["updatedAt"] != null){
        successStatus.value = true;
        user_name.value = editResponse["name"];
        user_job.value = editResponse["job"];
      }
    }catch(e){
      log(e.toString());
    }
  }

}