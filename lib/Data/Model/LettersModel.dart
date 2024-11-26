class LettersModel {
  int? letterId;
  String? letterBody;
  String? letterMean;

  LettersModel({this.letterId, this.letterBody, this.letterMean});

  LettersModel.fromJson(Map<String, dynamic> json) {
    letterId = json['letter_Id'];
    letterBody = json['letter_body'];
    letterMean = json['letter_mean'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['letter_Id'] = letterId;
    data['letter_body'] = letterBody;
    data['letter_mean'] = letterMean;
    return data;
  }
}
