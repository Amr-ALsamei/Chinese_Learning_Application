import 'package:chinese_ap/Controller/Testing/sentences_test_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/widget/Testing/customSentenceoptions.dart';
import 'package:chinese_ap/View/widget/Testing/customSentencesTestingLevels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
