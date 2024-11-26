import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Data/DataSource/remote/Forgetpassword/Resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  // late String NewPassword;
  // late String ReNewPassword;
  ResetPassword();
  goTSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstateRestpassword = GlobalKey<FormState>();

  late TextEditingController NewPassword;
  late TextEditingController ReNewPassword;
  bool isShowPassWord = false;
  bool isShowPassWord1 = false;
  String? email;
  StatusRequest statusRequest = StatusRequest.None;
  ResetPasswordData respasworddData = ResetPasswordData(Get.find());

  ShowPassWord() {
    isShowPassWord = isShowPassWord == true ? false : true;
    update();
  }

  ShowPassWord1() {
    isShowPassWord1 = isShowPassWord1 == true ? false : true;
    update();
  }

  @override
  ResetPassword() {}

  @override
  goTSuccessResetPassword() async {
    if (formstateRestpassword.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await respasworddData.ResetpasswordPostData(email!, NewPassword.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(RoutesApp.SuccessResetPassword);
          // Get.delete<SignUpControllerImp>();
        } else {
          Get.defaultDialog(
              title: "Wraning", middleText: "Your Email not correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    NewPassword = TextEditingController();
    ReNewPassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    NewPassword.dispose();
    ReNewPassword.dispose();
    super.dispose();
  }
}
