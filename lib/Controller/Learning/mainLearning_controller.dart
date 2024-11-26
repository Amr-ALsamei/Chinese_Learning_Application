import 'package:chinese_ap/Core/services/services.dart';
import 'package:get/get.dart';

class MainlearningController extends GetxController {
  MyServices myServices = Get.find();
  String username = '';

  goToLearningScreens(route) {
    Get.offNamed(route);
  }

  goToTestingScreens(route) {
    Get.offNamed(route);
  }

  @override
  void onInit() {
    username = myServices.sharedPref.getString("username")!;
    super.onInit();
  }
}
