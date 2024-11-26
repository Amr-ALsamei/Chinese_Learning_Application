import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class VocabularyData {
  Crud crud;
  VocabularyData(this.crud);

  getVocabularyData() async {
    var response = await crud.postData(AppLinks.vocabulariesview, {});
    return response.fold((l) => l, (r) => r);
  }

  addVocabularyData(Map data) async {
    var response = await crud.postData(AppLinks.vocabulariesadd, data);
    return response.fold((l) => l, (r) => r);
  }

  editVocabularyData(Map data) async {
    var response = await crud.postData(AppLinks.vocabulariesedit, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteVocabularyData(String id) async {
    var response =
        await crud.postData(AppLinks.vocabulariesdelete, {"vocabularyId": id});
    return response.fold((l) => l, (r) => r);
  }
}
