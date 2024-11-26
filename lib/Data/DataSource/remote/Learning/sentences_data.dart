import 'package:chinese_ap/Core/class/Crud.dart';
import 'package:chinese_ap/linkAPI.dart';

class SentencesData {
  Crud crud;
  SentencesData(this.crud);

  getSentenceData() async {
    var response = await crud.postData(AppLinks.sentencesview, {});
    return response.fold((l) => l, (r) => r);
  }

  addSentenceData(Map data) async {
    var response = await crud.postData(AppLinks.sentencesadd, data);
    return response.fold((l) => l, (r) => r);
  }

  editSentenceData(Map data) async {
    var response = await crud.postData(AppLinks.sentencesedit, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteSentenceData(String id) async {
    var response =
        await crud.postData(AppLinks.sentencesdelete, {"sentenceId": id});
    return response.fold((l) => l, (r) => r);
  }
}
