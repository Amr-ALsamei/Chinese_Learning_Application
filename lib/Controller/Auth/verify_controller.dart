import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Data/DataSource/remote/Forgetpassword/verfycoderesetpass.dart';
import 'package:get/get.dart';

abstract class VerificationController extends GetxController {
  CheckCode();
  goToResetPassword(verficationcode);
}

class VerificationControllerImp extends VerificationController {
  StatusRequest statusRequest = StatusRequest.None;
  String? email;
  VeryfyCodeResetPassWord vrestpass = VeryfyCodeResetPassWord(Get.find());
  @override
  CheckCode() {}

  @override
  goToResetPassword(verficationcode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await vrestpass.VerfyCodeResetPassWordPostData(email!, verficationcode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.toNamed(RoutesApp.resetpassword, arguments: {'email': email});
        // Get.delete<SignUpControllerImp>();
      } else {
        Get.defaultDialog(
            title: "Wraning", middleText: "VeryFiyCode number Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments['email'];
    super.onInit();
  }
}
