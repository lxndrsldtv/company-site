import 'dart:convert';
import 'package:test/test.dart';

import 'test_app_data.dart';
import 'package:hrw/models/home_model.dart';



void main() {
  
  test('HomeModel can be constructed from string constant', () async {
    HomeModel hmFromJsonString = HomeModel.fromJson(const JsonDecoder().convert(tstHomeData));
    expect(hmFromJsonString.header_1, 'tstHomeData header_1');
  });
}