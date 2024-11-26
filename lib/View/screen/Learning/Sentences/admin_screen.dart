import 'package:chinese_ap/Controller/Learning/Sentences/sentences_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentencesAdminScreen extends StatelessWidget {
  const SentencesAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SentencesController controller = Get.put(SentencesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("الجمل"),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(RoutesApp.mainlearningpage);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.primarycolor,
        onPressed: () {
          Get.toNamed(RoutesApp.sentenceaddpage);
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
          child: GetBuilder<SentencesController>(
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
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Text(
                                          textDirection: TextDirection.ltr,
                                          controller.data[i].sentenceBody!,
                                          style: TextStyle(height: 1.2),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          if (i < controller.data.length) {
                                            controller.speakFunction(controller
                                                .data[i].sentenceBody!);
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.toNamed(
                                              RoutesApp.sentenceeditpage,
                                              arguments: {
                                                "sentencesModel":
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
                                                  controller.data[i].sentenceId
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
