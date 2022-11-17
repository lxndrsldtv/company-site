class TextBlockModel {
  String header;
  String body;

  TextBlockModel({
    required this.header,
    required this.body,
  });

  TextBlockModel.empty()
      : header = '',
        body = '';

  TextBlockModel.fromJson(Map<String, dynamic> json)
      : header = json['header'] ?? '',
        body = json['body'] ?? '';
}
