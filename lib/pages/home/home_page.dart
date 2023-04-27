import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres/pages/home/home_controller.dart';
import 'package:reqres/routing/routing_names.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
          controller.page.value = 1;
          controller.getListUser();
        },
        child: controller.loading.value == true
            ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                  ))
                : SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.scroller,
                        itemCount: controller.allUser.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: ()=> Get.toNamed(Routes.single_user, arguments: controller.allUser[index].id),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width * 0.85,
                                  maxHeight: Get.height * 0.15,
                                ),
                                child: SizedBox(
                                  width: Get.width,
                                  height: Get.height * 0.2,
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                          child: CachedNetworkImage(
                                            width: Get.width * 0.27,
                                            height: Get.height,
                                            fit: BoxFit.fill,
                                            imageUrl: controller.allUser[index].avatar.toString(),
                                            errorWidget: (context, url, error) =>
                                                const Icon(
                                              Icons.person_2_rounded,
                                              size: 100,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                              child: Text(
                                                "Name: ",
                                                style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w300)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 5, 0, 0),
                                              child: Text(
                                                "${controller.allUser[index].firstName} ${controller.allUser[index].lastName}",
                                                style: GoogleFonts.lora(
                                                    textStyle: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 10, 0, 0),
                                              child: Text(
                                                "Email: ",
                                                style: GoogleFonts.nunitoSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w300)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 5, 0, 0),
                                              child: Text(
                                                  "${controller.allUser[index].email}",
                                                  style: GoogleFonts.lora(
                                                      textStyle: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600))),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: ()=> Get.toNamed(Routes.add_user),
        backgroundColor: Colors.black12,
        child: const Icon(
          CupertinoIcons.add_circled,
          size: 45,
        ),
      ),
    ));
  }
}