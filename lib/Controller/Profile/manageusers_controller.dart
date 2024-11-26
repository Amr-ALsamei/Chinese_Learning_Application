import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/manageusers_data.dart';
import 'package:get/get.dart';

class ManageUsersController extends GetxController {
  ManageUsersData manageUsersData =
      ManageUsersData(Get.find()); //Get.find() Takes from initialBinding
  MyServices myServices = Get.find();
  List data = [];

  StatusRequest statusRequest = StatusRequest.None;

  getusersInfo() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await manageUsersData.getusersData();
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

  deleteUser(String userid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await manageUsersData.delteusersData(userid);
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element["user_Id"].toString() == userid);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getusersInfo();
    super.onInit();
  }
}
