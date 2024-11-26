import 'package:chinese_ap/Controller/Learning/Vocabularies/vocabulary_Controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/widget/Learning/customVocabularyLearningLevels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VocabularyViewScreen extends StatelessWidget {
  const VocabularyViewScreen({super.key});

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
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          constraints: BoxConstraints(maxWidth: 500),
          child: GetBuilder<VocabulariesController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isChoose
                        ? Column(
                            children: [
                              Spacer(),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(18),
                                    color: Colors.blueGrey[100]),
                                child: Expanded(
                                  child: Text(
                                    "تعرف على صوت كلمة \" ${controller.translationtext} \" باللغة الصينية",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Appcolors.primarycolor),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                              Spacer(),
                              //////
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    // margin: const EdgeInsets.symmetric(vertical: 30),
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.blueGrey[100]),
                                    child: Text(
                                        "${controller.data[controller.indx].vocabularyBody}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Appcolors.primarycolor)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        int i = controller.indx;
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

                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 90),
                                      backgroundColor: Appcolors.primarycolor,
                                      foregroundColor: Appcolors.txtcolor),
                                  onPressed: () {
                                    int i = controller.indx + 1;
                                    if (i < controller.data.length) {
                                      controller.goTonext(i);
                                      controller.translationFun(
                                          controller.data[i].vocabularyBody);
                                    } else if (i == controller.data.length) {
                                      controller.ShowLevelsOn();
                                    }
                                  },
                                  child: Text(
                                    "التالي",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                        : VocabulariesLearningLevels(),
                  )),
        ),
      ),
    );
  }
}
