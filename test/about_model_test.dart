import 'dart:convert';
import 'package:test/test.dart';

import 'test_app_data.dart';
import 'package:hrw/models/about_model.dart';

void main() {
  
  test('AboutModel can be constructed from string constant', () async {
    AboutModel amFromJsonString = AboutModel.fromJson(const JsonDecoder().convert(tstAboutData));
    expect(amFromJsonString.header_1, 'appAboutData header_1');
  });
}