import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Auth/logInData.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();

  goToForgetPassword();
}

class LogInControllerImp extends LogInController {
  GlobalKey<FormState> formstatelog = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = false;

  StatusRequest statusRequest = StatusRequest.None;
  LogInData logInData = LogInData(Get.find());

  MyServices myServices = Get.find();

  ShowPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstatelog.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logInData.LogInPostData(email.text, password.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['user_aproov'] == 1) {
            myServices.sharedPref.setInt("type", response['data']['user_type']);
            myServices.sharedPref
                .setString("Id", response['data']['user_Id'].toString());
            // ignore: unused_local_variable
            String userid = myServices.sharedPref.getString("Id")!;
            myServices.sharedPref
                .setString("username", response['data']['user_Name']);
            myServices.sharedPref
                .setString("email", response['data']['user_email']);
            myServices.sharedPref
                .setString("phone", response['data']['user_phone'].toString());
            myServices.sharedPref.setString("step", "2");
            Get.offNamed(RoutesApp.home);
          } else {
            Get.toNamed(RoutesApp.verfyCodeSignUp,
                arguments: {"email": email.text});
          }
          // Get.delete<SignUpControllerImp>();
        } else {
          Get.defaultDialog(
              title: "تحذير", middleText: "كلمة المرور أو الايميل غير صحيح");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  goToSignUp() {
    Get.offNamed(RoutesApp.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    //////////////VocabulariesLevels///////////////
    for (int i = 0; i < 100; i++) {
      myServices.sharedPref.setDouble("Vocabularylevel$i", 0.0);
    }
    //////////////VocabulariesQusionLevels///////////////
    for (int i = 0; i < 100; i++) {
      myServices.sharedPref.setDouble("VocabularyQusionlevel$i", 0.0);
    }
    //////////////LettersLevels///////////////
    for (int i = 0; i < 100; i++) {
      myServices.sharedPref.setDouble("Letterlevel$i", 0.0);
    }
    //////////////LettersLevels///////////////
    for (int i = 0; i < 100; i++) {
      myServices.sharedPref.setDouble("LetterQusionlevel$i", 0.0);
    }
    //////////////SentencesLevels///////////////
    for (int i = 0; i < 100; i++) {
      myServices.sharedPref.setDouble("Sentencelevel$i", 0.0);
    }
    //////////////SentenceQusionLevels///////////////
    for (int i = 0; i < 100; i++) {
      myServices.sharedPref.setDouble("SentenceQuesionslevel$i", 0.0);
    }

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(RoutesApp.forgetpassword);
  }
}
