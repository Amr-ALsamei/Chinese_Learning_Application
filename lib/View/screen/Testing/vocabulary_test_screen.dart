import 'package:chinese_ap/Controller/Testing/vocabulary_test_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/widget/Testing/customVocabularyoptions.dart';
import 'package:chinese_ap/View/widget/Testing/customvocabularytestinglevels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VocabularyTestScreen extends StatelessWidget {
  const VocabularyTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    VocabulariesTesController controller = Get.put(VocabulariesTesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("اختبار المفردات"),
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
          child: GetBuilder<VocabulariesTesController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isChoose
                        ? Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 300),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blueGrey[100]),
                                    child: Flexible(
                                      child: Text(
                                          controller.anwser != ' '
                                              ? controller.anwser
                                              : '   ',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Appcolors.primarycolor)),
                                    ),
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
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(18),
                                    color: Colors.blueGrey[100]),
                                child: Text(
                                  "ماذا يعني الصوت السابق",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      color: Appcolors.primarycolor),
                                ),
                              ),
                              Spacer(),
                              Wrap(
                                children: List.generate(
                                    controller.optins.length,
                                    (j) => CustomVocabularyOptions(
                                        controller.optins[j])),
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 90),
                                      backgroundColor:
                                          controller.isDisable == false
                                              ? Appcolors.primarycolor
                                              : Colors.grey,
                                      foregroundColor: Appcolors.txtcolor),
                                  onPressed: controller.isDisable == false
                                      ? () {
                                          int i = controller.indx + 1;
                                          if (i < controller.data.length) {
                                            controller.getOptions(
                                                controller.data.length - 1, i);
                                            controller.goTonext(i);
                                            controller.translationFun(controller
                                                .data[i].vocabularyBody);
                                          } else if (i ==
                                              controller.data.length) {
                                            controller.ShowLevelsOn();
                                          }
                                        }
                                      : () {},
                                  child: Text(
                                    "التالي",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                        : VocabulariesTestingLevels(),
                  )),
        ),
      ),
    );
  }
}
