import 'package:chinese_ap/Controller/home_controller.dart';
import 'package:chinese_ap/View/widget/custombottomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CategoriesModel listdata;
    // ignore: unused_local_variable

    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        //////////////////////////////////////////////
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(controller.listPages.length, (index) {
                return CustomBottomAppBar(
                  onPressed: () {
                    controller.ChangePage(index);
                  },
                  title: controller.Bottomappbar[index]["title"],
                  icon: controller.Bottomappbar[index]["icon"],
                  active: controller.currentpage == index ? true : false,
                );
              }),
            ],
          ),
        ),
        body: controller.listPages.elementAt(controller.currentpage),
        // body:WillPopScope(
        //   child: controller.listPages.elementAt(controller.currentpage),
        //   onWillPop: (){
        //     Get.defaultDialog(
        //       title: "Alert",
        //       middleText: "Do you want to Exit",
        //       onConfirm: (){
        //         exit(0);
        //       },
        //       onCancel: () {

        //       },
        //       buttonColor: Appcolors.primarycolor
        //       );
        //    return Future.value(false);
        //  })
      ),
    );
  }
}
