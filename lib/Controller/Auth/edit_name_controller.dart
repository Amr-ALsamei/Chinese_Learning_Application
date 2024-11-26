import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Auth/SignUPData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserNameController extends GetxController {
  GlobalKey<FormState> formstateEdit = GlobalKey<FormState>();

  late TextEditingController userName;

  StatusRequest statusRequest = StatusRequest.None;

  SignupData signupData =
      SignupData(Get.find()); //Get.find() Takes from initialBinding

  List data = [];

  MyServices myServices = Get.find();

  editName() async {
    var response;
    if (formstateEdit.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      response = await signupData.editData(
          userName.text, myServices.sharedPref.getString("Id")!);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.defaultDialog(title: "تنبيه", middleText: "تم تعديل الاسم بنجاح");
          Get.offAllNamed(RoutesApp.login);
          // Get.delete<SignUpControllerImp>();
        } else {
          Get.defaultDialog(
              title: "تنبيه", middleText: "رقم الجوال أو الايميل غير صحيح");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    userName.text = myServices.sharedPref.getString("username")!;
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();

    super.dispose();
  }
}
