import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/community_data.dart';
import 'package:get/get.dart';

class CommunityController extends GetxController {
  CommunityData communityData =
      CommunityData(Get.find()); //Get.find() Takes from initialBinding
  MyServices myServices = Get.find();
  List data = [];

  StatusRequest statusRequest = StatusRequest.None;

  getCommunityInfo() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await communityData.getCommunityData();
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCommunityInfo();
    super.onInit();
  }
}
