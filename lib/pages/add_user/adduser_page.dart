import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres/pages/add_user/adduser_controller.dart';

class AddUserPage extends GetView<AddUserController>{
  const AddUserPage({super.key});

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
                "Request Response\nNew User",
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
              padding: const EdgeInsets.only(top: 10, bottom: 35),
              child: Text(
                "Welcome, Thank you for join with us",
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    )
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Form(
                key: controller.formkeyNewUser,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controller.edtname,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CupertinoIcons.person_alt_circle),
                        hintText: "Your name",
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
                          log("Please check the input");
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                        controller: controller.edtjob,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.task_alt_rounded),
                          hintText: "Your job",
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
                            log("Make sure you out something in there");
                          }
                        }
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
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
                      "Enter",
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
          Obx(() => SliverToBoxAdapter(
            child: Visibility(
              visible: controller.successStatus.value,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.85,
                    maxHeight: Get.height * 0.3,
                  ),
                  child: SizedBox(
                    width: Get.width * 0.85,
                    height: Get.height * 0.3,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Center(
                              child: Text(
                                  "User ID - ${controller.user_id.value}",
                                  style: GoogleFonts.lora(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600))),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black26,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(20, 5, 0, 0),
                            child: Text(
                              "Name",
                              style: GoogleFonts.nunitoSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                                "${controller.user_name.value}",
                                style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              "Job",
                              style: GoogleFonts.nunitoSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                                "${controller.user_job.value}",
                                style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}