import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الملف الشخصي",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Appcolors.primarycolor,
                  ),
                  Text(myServices.sharedPref.getString("username")!),
                  Text(myServices.sharedPref.getString("email")!),

                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.only(right: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blueGrey[100]),
                    child: const Text("الاعدادات العامة",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primarycolor)),
                  ),

                  Column(
                    children: [
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Get.toNamed(RoutesApp.editnamepage);
                            },
                            icon: const Icon(
                              Icons.edit_square,
                              size: 30,
                              color: Appcolors.secondcolor,
                            )),
                        title: const Text("تعديل الاسم"),
                      ),
                      // if(myServices.sharedPref.getString("admin") =="1")
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Get.toNamed(RoutesApp.manageuserspage);
                            },
                            icon: const Icon(
                              Icons.vpn_key_outlined,
                              size: 30,
                              color: Appcolors.secondcolor,
                            )),
                        title: const Text("ادارة المستخدمين"),
                      ),

                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Get.toNamed(RoutesApp.notificationviewpage);
                            },
                            icon: const Icon(
                              Icons.notifications_active,
                              size: 30,
                              color: Appcolors.secondcolor,
                            )),
                        title: const Text("الاشعارات"),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blueGrey[100]),
                    child: const Text("معلومات",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primarycolor)),
                  ),
                  ListTile(
                    leading: IconButton(
                        onPressed: () {
                          // Get.toNamed(RoutesApp.aboutapplicationpage);
                        },
                        icon: const Icon(
                          Icons.app_blocking_sharp,
                          size: 30,
                          color: Appcolors.secondcolor,
                        )),
                    title: const Text("عن التطبيق"),
                  ),
                  // ListTile(
                  //     leading: IconButton(onPressed: (){},
                  //      icon: const Icon(Icons.share_outlined,size: 30,color: Appcolors.secondcolor,)),
                  //     title: const Text("مشاركة التطبيق"),
                  //   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
