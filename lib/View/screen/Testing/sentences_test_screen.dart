import 'package:chinese_ap/Controller/Testing/sentences_test_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/widget/Testing/customSentenceoptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SentencesTestScreen extends StatelessWidget {
  const SentencesTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SentencesTesController controller = Get.put(SentencesTesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("اختبار الجمل"),
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
          child: GetBuilder<SentencesTesController>(
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
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.blueGrey[100]),
                                    child: Flexible(
                                      child: Wrap(
                                        textDirection: TextDirection.ltr,
                                        children: List.generate(
                                          controller.splitsentece.length,
                                          (index) => Text(
                                              textDirection: TextDirection.ltr,
                                              index == controller.trueoption
                                                  ? controller.isSelect == false
                                                      ? '...'
                                                      : controller.anwser!
                                                  : controller
                                                      .splitsentece[index],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  // height: 1.5,
                                                  color: index ==
                                                          controller.trueoption
                                                      ? Colors.red
                                                      : Appcolors
                                                          .primarycolor)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        int i = controller.indx;
                                        if (i < controller.data.length) {
                                          controller.speakFunction(
                                              controller.data[i].sentenceBody!);
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
                                  "حدد الحرف الناقص",
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
                                    (j) => CustomSentenceOptions(
                                        controller.optins[j],
                                        controller.optins[j] ==
                                                controller.trueoption
                                            ? controller.anwser!
                                            : controller.splitsentece[j])),
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
                                            controller.SplitSentencegetOptions(
                                                controller
                                                    .data[i].sentenceBody!);
                                            controller.goTonext(i);
                                            controller.translationFun(controller
                                                .data[i].sentenceBody);
                                          } else if (i ==
                                              controller.data.length) {
                                            controller.ShowLevelsOn();
                                          }
                                        }
                                      : () {},
                                  child: Text(
                                    "التالي",
                                    style: TextStyle(fontSize: 16),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                        : SentencesTestingLevels(),
                  )),
        ),
      ),
    );
  }
}

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
    return
        // Container(
        //   margin: EdgeInsets.all(30),
        //   // padding: EdgeInsets.all(15),
        //   width: 120,
        //   height: 120,
        //   child:
        SfRadialGauge(axes: <RadialAxis>[
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
    // );
  }
}
