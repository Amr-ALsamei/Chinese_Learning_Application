import 'package:chinese_ap/Controller/Testing/sentences_test_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../customProgress.dart';

class SentencesTestingLevels extends GetView<SentencesTesController> {
  const SentencesTestingLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate((controller.data.length ~/ 10) + 1, (level) {
        level = level + 1;
        int totallevels = (controller.data.length ~/ 10) + 1;
        return level % 3 == 0
            ? Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: 130,
                      height: 130,
                      margin: EdgeInsets.only(right: 40, top: 40),
                      child: InkWell(
                        onTap: () {
                          if (controller.myServices.sharedPref.getDouble(
                                  "SentenceQuesionslevel${level - 1}") ==
                              (level - 1) * 10) {
                            if (controller.myServices.sharedPref
                                    .getDouble("SentenceQuesionslevel$level")! <
                                (level * 10)) {
                              int h = controller.myServices.sharedPref
                                          .getDouble(
                                              "SentenceQuesionslevel$level")!
                                          .toInt() ==
                                      0
                                  ? controller.myServices.sharedPref
                                      .getDouble(
                                          "SentenceQuesionslevel${level - 1}")!
                                      .toInt()
                                  : controller.myServices.sharedPref
                                      .getDouble("SentenceQuesionslevel$level")!
                                      .toInt();
                              controller.SplitSentencegetOptions(
                                  controller.data[h].sentenceBody!);
                              controller.getNumberLevels(level, totallevels);
                              controller.translationFun(
                                  controller.data[h].sentenceBody);
                              controller.goTonext(h);
                            } else {
                              Get.defaultDialog(
                                title: "تنبيه",
                                content: Text(
                                    "هل تريد البدء مرة أخرى من هذا المستوى"),
                                onConfirm: () {
                                  int w = (level - 1) * 10;
                                  controller.SplitSentencegetOptions(
                                      controller.data[w].sentenceBody!);
                                  controller.getNumberLevels(
                                      level, totallevels);
                                  controller.goTonext(w);
                                  controller.translationFun(
                                      controller.data[w].sentenceBody);
                                  Get.back();
                                },
                                onCancel: () {
                                  Get.back();
                                },
                              );
                            }
                          }
                        },
                        child: CustomProgress(
                          min: (level - 1) * 10,
                          max: level * 10,
                          progvalue: controller.myServices.sharedPref
                              .getDouble("SentenceQuesionslevel$level")!
                              .toInt(),
                          isActive: controller.myServices.sharedPref.getDouble(
                                      "SentenceQuesionslevel${level - 1}") ==
                                  (level - 1) * 10
                              ? true
                              : false,
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(color: Colors.blueGrey[100]),
                    child: Text("إنتقال الى الدرس التالي",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primarycolor)),
                  ),
                ],
              )
            : Container(
                width: 130,
                height: 130,
                margin: level % 2 == 0
                    ? EdgeInsets.only(left: 40, top: 40)
                    : EdgeInsets.only(right: 40, top: 40),
                child: InkWell(
                  onTap: () {
                    if (controller.myServices.sharedPref
                            .getDouble("SentenceQuesionslevel${level - 1}") ==
                        (level - 1) * 10) {
                      if (controller.myServices.sharedPref
                              .getDouble("SentenceQuesionslevel$level")! <
                          (level * 10)) {
                        int h = controller.myServices.sharedPref
                                    .getDouble("SentenceQuesionslevel$level")!
                                    .toInt() ==
                                0
                            ? controller.myServices.sharedPref
                                .getDouble("SentenceQuesionslevel${level - 1}")!
                                .toInt()
                            : controller.myServices.sharedPref
                                .getDouble("SentenceQuesionslevel$level")!
                                .toInt();
                        controller.SplitSentencegetOptions(
                            controller.data[h].sentenceBody!);
                        controller.getNumberLevels(level, totallevels);
                        controller
                            .translationFun(controller.data[h].sentenceBody);
                        controller.goTonext(h);
                      } else {
                        Get.defaultDialog(
                          title: "تنبيه",
                          content:
                              Text("هل تريد البدء مرة أخرى من هذا المستوى"),
                          onConfirm: () {
                            int w = (level - 1) * 10;
                            controller.SplitSentencegetOptions(
                                controller.data[w].sentenceBody!);
                            controller.getNumberLevels(level, totallevels);
                            controller.goTonext(w);
                            controller.translationFun(
                                controller.data[w].sentenceBody);
                            Get.back();
                          },
                          onCancel: () {
                            Get.back();
                          },
                        );
                      }
                    }
                  },
                  child: CustomProgress(
                      min: (level - 1) * 10,
                      max: level * 10,
                      progvalue: controller.myServices.sharedPref
                          .getDouble("SentenceQuesionslevel$level")!
                          .toInt(),
                      isActive: controller.myServices.sharedPref.getDouble(
                                  "SentenceQuesionslevel${level - 1}") ==
                              (level - 1) * 10
                          ? true
                          : false),
                ));
      }),
    );
  }
}
