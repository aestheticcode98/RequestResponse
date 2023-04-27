import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reqres/api/api2.dart';
import 'package:reqres/routing/routing_names.dart';

import 'login_api.dart';

class LoginController extends GetxController{
  final LoginApi api;
  LoginController({required this.api});

  var edtUsername = TextEditingController();
  var edtPassword = TextEditingController();

  var showPass = true.obs;
  final formkeyLogin = GlobalKey<FormState>();

  @override
  void onClose() {
    super.onClose();
    edtUsername.dispose();
    edtPassword.dispose();
  }

  validator(){
    if(formkeyLogin.currentState!.validate()){
      if(edtUsername.text.isNotEmpty && edtPassword.text.isNotEmpty){
        loginUser();
      }else{
        Get.snackbar(
            "Input",
            "Please check the input",
            snackPosition: SnackPosition.BOTTOM
        );
      }
    }
  }

  loginUser()async{
    try{
      var loginResponse = await api.loginUser(
          email: edtUsername.text,
          password: edtPassword.text);

      if(loginResponse ["token"] != null || loginResponse["token"] != ""){
        await Api2().setIsLogin(isLogin: true);
        await Api2().setToken(token: loginResponse["token"]);
        Get.offAllNamed(Routes.home);
      }else{
        Get.snackbar(
            "Log In",
            loginResponse["error"],
          snackPosition: SnackPosition.BOTTOM
        );
      }

    }catch(e){
      log(e.toString());
    }
  }
}