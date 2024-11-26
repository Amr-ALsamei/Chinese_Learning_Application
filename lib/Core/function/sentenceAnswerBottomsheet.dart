import 'package:chinese_ap/Controller/Testing/sentences_test_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SentencesTesController controller = Get.find();
void SentenceTrueAnswerBottomSheet() {
  Get.bottomSheet(
    backgroundColor: const Color.fromARGB(255, 243, 235, 235),
    isDismissible: false,
    enableDrag: false,
    Container(
      constraints: BoxConstraints(maxWidth: 500),
      padding: EdgeInsets.only(top: 10, bottom: 15),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: GetBuilder<SentencesTesController>(builder: (controller) {
        return Column(children: [
          Icon(
            Icons.check_circle,
            size: 50,
            color: Colors.green,
          ),
          Spacer(),
          Text(
            "إجابة صحيحة!",
            style: TextStyle(color: Colors.green),
          ),
          Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  backgroundColor: Appcolors.primarycolor,
                  foregroundColor: Appcolors.txtcolor),
              onPressed: () {
                controller.score += 1;
                int i = controller.indx + 1;
                if (i < controller.data.length) {
                  controller.SplitSentencegetOptions(
                      controller.data[i].sentenceBody!);
                  controller.goTonext(i);
                  controller.translationFun(controller.data[i].sentenceBody);
                } else if (i == controller.data.length) {
                  controller.ShowLevelsOn();
                }
                Get.back();
              },
              child: Text(
                "التالي",
                style: TextStyle(fontSize: 18),
              )),
        ]);
      }),
    ),
  );
}

void SentenceFalseAnswerBottomSheet() {
  Get.bottomSheet(
    backgroundColor: const Color.fromARGB(255, 243, 235, 235),
    isDismissible: false,
    enableDrag: false,
    Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      constraints: BoxConstraints(maxWidth: 500),
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: GetBuilder<SentencesTesController>(builder: (controller) {
        return Column(children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(
              Icons.close_sharp,
              // size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "إجابة خاطئة!",
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 90),
                side: BorderSide(width: 1.5, color: Appcolors.primarycolor),
                backgroundColor: Colors.white,
                foregroundColor: Appcolors.primarycolor,
              ),
              onPressed: () {
                controller.score += 0;
                int i = controller.indx + 1;
                if (i < controller.data.length) {
                  controller.SplitSentencegetOptions(
                      controller.data[i].sentenceBody!);
                  controller.goTonext(i);
                  controller.translationFun(controller.data[i].sentenceBody);
                } else if (i == controller.data.length) {
                  controller.ShowLevelsOn();
                }
                Get.back();
              },
              child: Text(
                "تخطي",
                style: TextStyle(fontSize: 18),
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  backgroundColor: Appcolors.primarycolor,
                  foregroundColor: Appcolors.txtcolor),
              onPressed: () {
                Get.back();
              },
              child: Text(
                "إعادة المحاولة",
                style: TextStyle(fontSize: 18),
              )),
        ]);
      }),
    ),
  );
}