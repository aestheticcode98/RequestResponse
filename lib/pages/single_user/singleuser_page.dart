import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres/pages/single_user/singleuser_controller.dart';
import 'package:reqres/routing/routing_names.dart';

class SingleUserPage extends GetView<SingleUserController> {
  const SingleUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.loading.value == true
              ? const Center(
                child: CircularProgressIndicator()
          )
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: CachedNetworkImage(
                        width: Get.width,
                        height: Get.height * 0.45,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        imageUrl: controller.singleUserResponse.value.avatar.toString(),
                        errorWidget: (context, url, error) => Container(
                          width: Get.width,
                          height: Get.height * 0.45,
                          color: Colors.black26,
                          child: const Icon(
                            Icons.person_2_rounded,
                            color: Colors.black38,
                            size: 250,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
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
                                          "${controller.singleUserResponse.value.firstName} ${controller.singleUserResponse.value.lastName}",
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
                                      "User ID",
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
                                        "${controller.singleUserResponse.value.id}",
                                        style: GoogleFonts.lora(
                                            textStyle: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text(
                                      "Email",
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
                                        "${controller.singleUserResponse.value.email}",
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
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: ()=> Get.toNamed(Routes.edit_user, arguments: controller.singleUserResponse.value.id),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.blueGrey,
                                    fixedSize: Size(Get.width * 0.43, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    )
                                ),
                                child: Text(
                                    "Edit",
                                    style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800
                                        )
                                    )
                                )
                            ),
                            ElevatedButton(
                                onPressed: ()=> controller.deleteData(),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    fixedSize: Size(Get.width * 0.43, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                        color: Colors.blueGrey,
                                        width: 1
                                      )
                                    )
                                ),
                                child: Text(
                                    "Delete",
                                    style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w800
                                        )
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}
