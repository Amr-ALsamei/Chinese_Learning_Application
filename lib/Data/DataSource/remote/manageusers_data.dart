import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class ManageUsersData {
  Crud crud;
  ManageUsersData(this.crud);

  getusersData() async {
    var response = await crud.postData(AppLinks.usersinfo, {});
    return response.fold((l) => l, (r) => r);
  }

  delteusersData(String userid) async {
    var response = await crud
        .postData(AppLinks.deleteusersinfo, {"userId": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
