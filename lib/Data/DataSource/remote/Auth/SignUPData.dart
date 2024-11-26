import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  SignupPostData(
      String username, String password, String emal, String phone) async {
    var response = await crud.postData(AppLinks.signup, {
      "username": username,
      "password": password,
      "email": emal,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String username, String userid) async {
    var response = await crud.postData(AppLinks.edituserdata, {
      "username": username.toString(),
      "userid": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
