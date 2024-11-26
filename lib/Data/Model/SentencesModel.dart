class SentencesModel {
  int? sentenceId;
  String? sentenceBody;

  SentencesModel({this.sentenceId, this.sentenceBody});

  SentencesModel.fromJson(Map<String, dynamic> json) {
    sentenceId = json['sentence_Id'];
    sentenceBody = json['sentence_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sentence_Id'] = this.sentenceId;
    data['sentence_body'] = this.sentenceBody;
    return data;
  }
}
