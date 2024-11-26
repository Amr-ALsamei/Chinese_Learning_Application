import 'package:chinese_ap/Controller/Learning/Letters/letters_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/widget/Learning/customLettersLearningLevels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LettersViewScreen extends StatelessWidget {
  const LettersViewScreen({super.key});

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
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          constraints: BoxConstraints(maxWidth: 500),
          child: GetBuilder<LettersController>(
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
                                    "تعرف على صوت حرف \" ${controller.data[controller.indx].letterMean} \" باللغة الصينية",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 22,
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
                                        "${controller.data[controller.indx].letterBody}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Appcolors.primarycolor)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        int i = controller.indx;
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
                                          controller.data[i].letterBody);
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
                        : LettersLearningLevels(),
                  )),
        ),
      ),
    );
  }
}
