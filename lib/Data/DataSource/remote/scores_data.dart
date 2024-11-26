import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class ScoresData {
  Crud crud;
  ScoresData(this.crud);

  addData(String userid, String scores) async {
    var response = await crud
        .postData(AppLinks.addscores, {'userId': userid, 'score': scores});
    return response.fold((l) => l, (r) => r);
  }
}
