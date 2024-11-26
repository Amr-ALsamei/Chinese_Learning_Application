import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class LettersData {
  Crud crud;
  LettersData(this.crud);

  getLettersData() async {
    var response = await crud.postData(AppLinks.lettersview, {});
    return response.fold((l) => l, (r) => r);
  }

  addLetterData(Map data) async {
    var response = await crud.postData(AppLinks.lettersadd, data);
    return response.fold((l) => l, (r) => r);
  }

  editLetterData(Map data) async {
    var response = await crud.postData(AppLinks.lettersedit, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteLetterData(String id) async {
    var response =
        await crud.postData(AppLinks.lettersdelete, {"letterId": id});
    return response.fold((l) => l, (r) => r);
  }
}
