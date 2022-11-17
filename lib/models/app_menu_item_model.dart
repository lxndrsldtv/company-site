import 'package:flutter/material.dart';

class AppMenuItemModelId {
  final String value;

  AppMenuItemModelId(this.value);

  @override
  bool operator ==(Object other) {
    return other is AppMenuItemModelId && value == other.value;
  }

  @override
  int get hashCode => value.hashCode;
}

class AppMenuItemModel {
  final AppMenuItemModelId id;
  final String label;
  final IconData icon;
  final bool isDefault;

  // Size get size => _size;
  Size size = const Size(0.0, 0.0);
  // set size(Size itemSize) => _size = itemSize;

  double leftOffset = 0.0;

  // GlobalKey? get globalKey => _globalKey;
  GlobalKey? globalKey;
  // set globalKey(GlobalKey? itemGlobalKey) => _globalKey = itemGlobalKey;

  bool isSelected = false;

  AppMenuItemModel({
    required this.id,
    required this.label,
    this.icon = Icons.question_mark,
    this.isDefault = false,
  });
}
