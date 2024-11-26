import 'package:chinese_ap/Controller/Learning/mainLearning_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/widget/Learning/customLearningCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLearningScreen extends StatelessWidget {
  const MainLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainlearningController controller = Get.put(MainlearningController());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Appcolors.primarycolor,
        // centerTitle: true,
        title: Text(
          controller.username,
        ),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(RoutesApp.notificationviewpage);
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.amber,
            )),
      ),
      floatingActionButton: Container(
        width: 270,
        height: 100,
        margin: const EdgeInsets.only(top: 80, right: 15),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Appcolors.thirdcolor),
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "ابدأ الان",
                  style: TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.cast_for_education,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
            Divider(
              height: 0,
              color: Colors.white,
            ),
            Expanded(
              child: Text(
                "ابدأ الان متعة تعلم اللغة الصينية واكتشف المزيد عن التراث الصيني",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: Colors.white,
                ),
                overflow: TextOverflow.visible,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              ////////////Learning Sections//////////////////////
              const ListTile(
                title: Text(
                  "الاساسيات",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "تعلم الجمل الاساسية والمفردات",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.myServices.sharedPref.getInt("type") ==
                            1) {
                          controller.goToLearningScreens(
                              RoutesApp.vocabularyadminviewpage);
                        } else {
                          controller.goToLearningScreens(
                              RoutesApp.vocabularyviewpage);
                        }
                      },
                      child: Customlearningcard(
                          imag: "assets/images/vocabularylogo.jpg",
                          titletxt: "المفردات"),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.myServices.sharedPref.getInt("type") ==
                            1) {
                          controller.goToLearningScreens(
                              RoutesApp.sentenceadminviewpage);
                        } else {
                          controller
                              .goToLearningScreens(RoutesApp.sentenceviewpage);
                        }
                      },
                      child: Customlearningcard(
                          imag: "assets/images/sentencelogo.jpg",
                          titletxt: "الجمل"),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.myServices.sharedPref.getInt("type") ==
                            1) {
                          controller.goToLearningScreens(
                              RoutesApp.lettersadminviewpage);
                        } else {
                          controller
                              .goToLearningScreens(RoutesApp.lettersviewpage);
                        }
                      },
                      child: Customlearningcard(
                          imag: "assets/images/one.png", titletxt: "الحروف"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ////////////Testing Sections//////////////////////
              const ListTile(
                title: Text(
                  "الاختبارات",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text(
                //   "تعلم الجمل الاساسية والمفردات",
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
              ),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        controller
                            .goToTestingScreens(RoutesApp.vocabularytestpage);
                      },
                      child: Customlearningcard(
                          imag: "assets/images/vocabularylogo.jpg",
                          titletxt: "المفردات"),
                    ),
                    InkWell(
                      onTap: () {
                        controller
                            .goToTestingScreens(RoutesApp.sentencestestpage);
                      },
                      child: Customlearningcard(
                          imag: "assets/images/sentencelogo.jpg",
                          titletxt: "الجمل"),
                    ),
                    InkWell(
                      onTap: () {
                        controller
                            .goToTestingScreens(RoutesApp.letterstestpage);
                      },
                      child: Customlearningcard(
                          imag: "assets/images/one.png", titletxt: "الحروف"),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     controller.goToTestingScreens(RoutesApp.login);
                    //   },
                    //   child: Customlearningcard(
                    //       imag: "assets/images/one.png", titletxt: "الحروف"),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// RadialAxis(
//                         minimum: 0,
//                         maximum: 100,
//                         showLabels: false,
//                         showTicks: false,
//                         startAngle: 270,
//                         endAngle: 270,
//                         axisLineStyle: AxisLineStyle(
//                           thickness: 1,
//                           color: const Color.fromARGB(255, 0, 169, 181),
//                           thicknessUnit: GaugeSizeUnit.factor,
//                         ),
//                         pointers: <GaugePointer>[
//                           RangePointer(
//                             value: progressValue,
//                             width: 0.15
//                             color: Colors.white,
//                             pointerOffset: 0.1,
//                             cornerStyle: CornerStyle.bothCurve,
//                             sizeUnit: GaugeSizeUnit.factor,
//                           )
//                         ],