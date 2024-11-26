import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/letters_data.dart';
import 'package:chinese_ap/Data/Model/LettersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LettersEditController extends GetxController {
  StatusRequest statusRequest = StatusRequest.None;
  LettersData lettersData = LettersData(Get.find());

  LettersModel? lettersModel;
  late TextEditingController letter;
  late TextEditingController lettermean;
  GlobalKey<FormState> formsate = GlobalKey<FormState>();
  String? letterid;

  editData() async {
    if (formsate.currentState!.validate()) {
      Map data = {
        "letter": letter.text,
        "mean": lettermean.text,
        "letterId": letterid,
      };

      statusRequest = StatusRequest.loading;
      update();
      var response = await lettersData.editLetterData(data);
      // var response=await carsData.editCarsData(data);
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("تنبيه", "تم التعديل بنجاح");
          Get.offAllNamed(RoutesApp.lettersadminviewpage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    lettersModel = Get.arguments["lettersModel"];

    letter = TextEditingController();
    lettermean = TextEditingController();
    //////////////////////////////

    letter.text = lettersModel!.letterBody!;
    lettermean.text = lettersModel!.letterMean!;
    letterid = lettersModel!.letterId.toString();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    letter.dispose();
    lettermean.dispose();
    super.dispose();
  }
}
