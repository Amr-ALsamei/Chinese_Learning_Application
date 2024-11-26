import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class CommunityData {
  Crud crud;
  CommunityData(this.crud);

  getCommunityData() async {
    var response = await crud.postData(AppLinks.communityinfo, {});
    return response.fold((l) => l, (r) => r);
  }

  // delteusersData(String userid) async {
  //   var response = await crud
  //       .postData(AppLinks.deleteusersinfo, {"userId": userid.toString()});
  //   return response.fold((l) => l, (r) => r);
  // }
}
