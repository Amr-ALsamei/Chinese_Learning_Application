import 'package:chinese_ap/Controller/Learning/Letters/letters_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LettersAdminScreen extends StatelessWidget {
  const LettersAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    LettersController controller = Get.put(LettersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("الحروف"),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RoutesApp.home);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.primarycolor,
        onPressed: () {
          Get.toNamed(RoutesApp.lettersaddpage);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<LettersController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) => Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(controller.data[i].letterBody!),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          if (i < controller.data.length) {
                                            controller.speakFunction(
                                                controller.data[i].letterBody!);
                                          }
                                        },
                                        icon: Icon(
                                          Icons.volume_down_alt,
                                          size: 40,
                                          color: Appcolors.primarycolor,
                                        )),
                                  ],
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.toNamed(RoutesApp.letterseditpage,
                                              arguments: {
                                                "lettersModel":
                                                    controller.data[i]
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 40,
                                          color: Appcolors.primarycolor,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title: "تنبيه",
                                              middleText:
                                                  "هل تريد بالفعل الحذف ",
                                              onCancel: () {},
                                              onConfirm: () {
                                                controller.deleteData(
                                                  controller.data[i].letterId
                                                      .toString(),
                                                );
                                                Get.back();
                                              });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          size: 40,
                                          color: Appcolors.primarycolor,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          )))),
        ),
      ),
    );
  }
}
