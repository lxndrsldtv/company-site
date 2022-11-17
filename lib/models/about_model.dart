import './text_block_model.dart';

class AboutModel {
  //extends ChangeNotifier {
  String header_1;
  String header_2;
  String header_3;
  String verticalText;
  List<TextBlockModel> textBlocks;

  AboutModel.fromJson(Map<String, dynamic> json)
      : header_1 = json['header_1'] ?? '',
        header_2 = json['header_2'] ?? '',
        header_3 = json['header_3'] ?? '',
        verticalText = json['verticalText'] ?? '',
        textBlocks = (json['textBlocks']['textBlock'] as List<dynamic>)
            .map((textBlockJson) => TextBlockModel.fromJson(textBlockJson))
            .toList();
}
