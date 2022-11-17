import './text_block_model.dart';

class ServicesModel {
  String header_1;
  String header_2;
  String verticalText;
  List<TextBlockModel> textBlocks;

  ServicesModel.fromJson(Map<String, dynamic> json)
      : header_1 = json['header_1'] ?? '',
        header_2 = json['header_2'] ?? '',
        verticalText = json['verticalText'] ?? '',
        textBlocks = (json['textBlocks']['textBlock'] as List<dynamic>)
            .map((textBlockJson) => TextBlockModel.fromJson(textBlockJson))
            .toList();
}
