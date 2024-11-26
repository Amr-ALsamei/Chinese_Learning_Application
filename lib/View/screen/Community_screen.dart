import 'package:chinese_ap/Controller/community_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CommunityController controller = Get.put(CommunityController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondcolor,
        title: Text(" المجتمع"),
        //   leading: IconButton(
        //       onPressed: () {
        //         Get.offAllNamed(RoutesApp.profileviewpage);
        //       },
        //       icon: Icon(Icons.arrow_back)),
        //
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: GetBuilder<CommunityController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      ...List.generate(
                          controller.data.length,
                          (index) => Container(
                                // padding: EdgeInsets.all(5),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: SizedBox(
                                                height: 90,
                                                width: 90,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Appcolors.secondcolor,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/avatar.png"),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${controller.data[index]["user_Name"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  controller.data[index]
                                                              ["user_type"] ==
                                                          0
                                                      ? "مستخدم"
                                                      : "أدمن",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      color: Appcolors
                                                          .secondcolor),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            // Text("جوال: ${controller.data[index]["user_phone"]}",overflow:TextOverflow.ellipsis,softWrap: false,style: TextStyle(height: 0),),
                                          ],
                                        ),
                                        Text(
                                          textDirection: TextDirection.ltr,
                                          "${controller.data[index]["total_scores"]} XP",
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                              color: Appcolors.secondcolor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                    ],
                  ))),
        ),
      ),
    );
  }
}
