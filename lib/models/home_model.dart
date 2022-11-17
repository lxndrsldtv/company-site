class HomeModel {
  String header_1;
  String header_2;
  String header_3;
  String verticalText;
  String content;

  HomeModel.fromJson(Map<String, dynamic> json)
      : header_1 = json['header_1'] ?? '',
        header_2 = json['header_2'] ?? '',
        header_3 = json['header_3'] ?? '',
        verticalText = json['verticalText'] ?? '',
        content = json['content'] ?? '';
}
