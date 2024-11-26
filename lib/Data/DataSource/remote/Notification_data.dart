import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getNotificationData(String userid) async {
    var response = await crud
        .postData(AppLinks.notifications, {"userId": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
