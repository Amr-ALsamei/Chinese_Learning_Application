class VocabularyModel {
  int? vocabularyId;
  String? vocabularyBody;

  VocabularyModel({this.vocabularyId, this.vocabularyBody});

  VocabularyModel.fromJson(Map<String, dynamic> json) {
    vocabularyId = json['vocabulary_Id'];
    vocabularyBody = json['vocabulary_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vocabulary_Id'] = vocabularyId;
    data['vocabulary_body'] = vocabularyBody;
    return data;
  }
}
