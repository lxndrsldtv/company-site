import 'dart:convert';
import 'package:test/test.dart';

import 'test_app_data.dart';
import 'package:hrw/models/app_menu_model.dart';

void main() {
  
  test('AppMenu can be defined as string in source file', () async { 
    AppMenuModel amFromString = AppMenuModel.fromJson(const JsonDecoder().convert(tstMenuData));
    expect(amFromString.items.length, 4);
  });
}