import 'package:chinese_ap/Controller/Learning/Vocabularies/vocabulary_Controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VocabularyAdminScreen extends StatelessWidget {
  const VocabularyAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    VocabulariesController controller = Get.put(VocabulariesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("المفردات"),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RoutesApp.home);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.primarycolor,
        onPressed: () {
          Get.toNamed(RoutesApp.vocabularyaddpage);
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
          child: GetBuilder<VocabulariesController>(
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
                                      child: Text(
                                          controller.data[i].vocabularyBody!),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          if (i < controller.data.length) {
                                            controller.speakFunction(controller
                                                .data[i].vocabularyBody!);
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
                                          Get.toNamed(
                                              RoutesApp.vocabularyeditpage,
                                              arguments: {
                                                "vocabularyModel":
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
                                                  controller
                                                      .data[i].vocabularyId
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
