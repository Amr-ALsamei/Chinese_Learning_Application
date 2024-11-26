import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/vocabulary_data.dart';
import 'package:chinese_ap/Data/Model/VocabularyModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VocabularyEditController extends GetxController {
  StatusRequest statusRequest = StatusRequest.None;
  VocabularyData vocabularyData = VocabularyData(Get.find());

  VocabularyModel? vocabularyModel;
  late TextEditingController vocabulary;

  GlobalKey<FormState> formsate = GlobalKey<FormState>();
  String? vocabularyid;

  editData() async {
    if (formsate.currentState!.validate()) {
      Map data = {
        "vocabulary": vocabulary.text,
        "vocabularyId": vocabularyid,
      };

      statusRequest = StatusRequest.loading;
      update();
      var response = await vocabularyData.editVocabularyData(data);
      // var response=await carsData.editCarsData(data);
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("تنبيه", "تم التعديل بنجاح");
          Get.offAllNamed(RoutesApp.vocabularyadminviewpage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    vocabularyModel = Get.arguments["vocabularyModel"];

    vocabulary = TextEditingController();
    //////////////////////////////

    vocabulary.text = vocabularyModel!.vocabularyBody!;
    vocabularyid = vocabularyModel!.vocabularyId.toString();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    vocabulary.dispose();
    super.dispose();
  }
}
