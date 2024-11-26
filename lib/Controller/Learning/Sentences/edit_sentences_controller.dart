import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/sentences_data.dart';
import 'package:chinese_ap/Data/Model/SentencesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentencesEditController extends GetxController {
  StatusRequest statusRequest = StatusRequest.None;
  SentencesData sentencesData = SentencesData(Get.find());

  SentencesModel? sentencesModel;
  late TextEditingController sentece;

  GlobalKey<FormState> formsate = GlobalKey<FormState>();
  String? sentenceid;

  editData() async {
    if (formsate.currentState!.validate()) {
      Map data = {
        "sentence": sentece.text,
        "sentenceId": sentenceid,
      };

      statusRequest = StatusRequest.loading;
      update();
      var response = await sentencesData.editSentenceData(data);

      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("تنبيه", "تم التعديل بنجاح");
          Get.offAllNamed(RoutesApp.sentenceadminviewpage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    sentencesModel = Get.arguments["sentencesModel"];

    sentece = TextEditingController();
    //////////////////////////////

    sentece.text = sentencesModel!.sentenceBody!;
    sentenceid = sentencesModel!.sentenceId.toString();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    sentece.dispose();
    super.dispose();
  }
}
