import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);

  LogInPostData(String emal, String password) async {
    var response = await crud.postData(AppLinks.login, {
      "email": emal,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
