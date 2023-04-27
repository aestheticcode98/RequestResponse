import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres/pages/regis/regis_controller.dart';

class RegisPage extends GetView<RegisController>{
  const RegisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Register\nUser",
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w800
                    )
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 35),
              child: Text(
                "Sign up",
                style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    )
                ),
              ),
            ),
          ),
          Obx(() => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Form(
                key: controller.formkeyRegis,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controller.edtUsername,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CupertinoIcons.person_alt_circle),
                        hintText: "Username",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value){
                        if(value!.isNotEmpty){
                          return null;
                        }else{
                          log("Username is not correct");
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                        obscureText: controller.showPass.value,
                        controller: controller.edtPassword,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(CupertinoIcons.lock_circle),
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value!.isNotEmpty){
                            return null;
                          }else{
                            log("Password is not correct");
                          }
                        }
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: ()=> (controller.showPass.value == false) ? controller.showPass(true) : controller.showPass(false),
                            child: Text(
                              "Show Password",
                              style: GoogleFonts.lora(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  onPressed: ()=> controller.validator(),
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Colors.blueGrey,
                      fixedSize: Size(Get.width, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                  child: Text(
                      "Register",
                      style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w800
                          )
                      )
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}