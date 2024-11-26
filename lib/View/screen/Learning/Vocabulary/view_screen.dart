import 'package:chinese_ap/Controller/Learning/Vocabularies/vocabulary_Controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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

class VocabulariesLearningLevels extends GetView<VocabulariesController> {
  const VocabulariesLearningLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate((controller.data.length ~/ 10) + 1, (level) {
        level = level + 1;
        int totallevels = (controller.data.length ~/ 10) + 1;
        return level % 3 == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 130,
                      width: 130,
                      margin: EdgeInsets.only(right: 40, top: 40),
                      child: InkWell(
                        onTap: () {
                          if (controller.myServices.sharedPref
                                  .getDouble("Vocabularylevel${level - 1}") ==
                              (level - 1) * 10) {
                            if (controller.myServices.sharedPref
                                    .getDouble("Vocabularylevel$level")! <
                                (level * 10)) {
                              int h = controller.myServices.sharedPref
                                          .getDouble("Vocabularylevel$level")!
                                          .toInt() ==
                                      0
                                  ? controller.myServices.sharedPref
                                      .getDouble("Vocabularylevel${level - 1}")!
                                      .toInt()
                                  : controller.myServices.sharedPref
                                      .getDouble("Vocabularylevel$level")!
                                      .toInt();
                              controller.getNumberLevels(level, totallevels);
                              controller.translationFun(
                                  controller.data[h].vocabularyBody);
                              controller.goTonext(h);
                            } else {
                              Get.defaultDialog(
                                title: "تنبيه",
                                content: Text(
                                    "هل تريد البدء مرة أخرى من هذا المستوى"),
                                onConfirm: () {
                                  int w = (level - 1) * 10;
                                  controller.getNumberLevels(
                                      level, totallevels);
                                  controller.goTonext(w);
                                  controller.translationFun(
                                      controller.data[w].vocabularyBody);
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
                              .getDouble("Vocabularylevel$level")!
                              .toInt(),
                          isActive: controller.myServices.sharedPref.getDouble(
                                      "Vocabularylevel${level - 1}") ==
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
                            fontSize: 22, color: Appcolors.primarycolor)),
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
                            .getDouble("Vocabularylevel${level - 1}") ==
                        (level - 1) * 10) {
                      if (controller.myServices.sharedPref
                              .getDouble("Vocabularylevel$level")! <
                          (level * 10)) {
                        int h = controller.myServices.sharedPref
                                    .getDouble("Vocabularylevel$level")!
                                    .toInt() ==
                                0
                            ? controller.myServices.sharedPref
                                .getDouble("Vocabularylevel${level - 1}")!
                                .toInt()
                            : controller.myServices.sharedPref
                                .getDouble("Vocabularylevel$level")!
                                .toInt();
                        controller.getNumberLevels(level, totallevels);
                        controller
                            .translationFun(controller.data[h].vocabularyBody);
                        controller.goTonext(h);
                      } else {
                        Get.defaultDialog(
                          title: "تنبيه",
                          content:
                              Text("هل تريد البدء مرة أخرى من هذا المستوى"),
                          onConfirm: () {
                            int w = (level - 1) * 10;
                            controller.getNumberLevels(level, totallevels);
                            controller.goTonext(w);
                            controller.translationFun(
                                controller.data[w].vocabularyBody);
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
                          .getDouble("Vocabularylevel$level")!
                          .toInt(),
                      isActive: controller.myServices.sharedPref
                                  .getDouble("Vocabularylevel${level - 1}") ==
                              (level - 1) * 10
                          ? true
                          : false),
                ));
      }),
    );
  }
}

class CustomProgress extends StatelessWidget {
  const CustomProgress(
      {super.key,
      required this.min,
      required this.max,
      required this.progvalue,
      required this.isActive});
  final double min;
  final double max;
  final int progvalue;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: min,
        maximum: max,
        showLabels: false,
        showTicks: false,
        startAngle: 270,
        endAngle: 270,
        axisLineStyle: AxisLineStyle(
          thickness: 1,
          color:
              isActive == true ? Color.fromARGB(255, 0, 169, 181) : Colors.grey,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        pointers: <GaugePointer>[
          RangePointer(
            value: progvalue.toDouble(),
            width: 0.15,
            color: Colors.white,
            pointerOffset: 0.1,
            cornerStyle: CornerStyle.bothCurve,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              positionFactor: 0.1,
              angle: 90,
              widget: Text(
                "$progvalue" '%',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))
        ],
      )
    ]);
  }
}