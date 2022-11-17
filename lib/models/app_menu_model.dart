import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './app_menu_item_model.dart';

class AppMenuModel with ChangeNotifier {
  final String imageLogoAssetPath;
  final List<AppMenuItemModel> items;

  final logger = Logger('AppMenuModel');

  // AppMenuModel({required this.items});

  AppMenuModel.empty()
      : imageLogoAssetPath = '',
        items = const [];

  // AppMenuModel.fromJson(List<dynamic> json)
  //     : items = json
  //           .map((appMenuItemJson) => AppMenuItemModel(
  //                 id: AppMenuItemModelId(appMenuItemJson['id']),
  //                 label: appMenuItemJson['label'],
  //                 icon: getIconByName(appMenuItemJson['icon']),
  //                 isDefault: appMenuItemJson['isDefault'] ?? false,
  //               ))
  //           .toList();

  AppMenuModel.fromJson(Map<String, dynamic> json)
      : imageLogoAssetPath = json['imageLogo'] ?? '',
        items = (json['menuItems']['menuItem'] as List<dynamic>)
            .map((appMenuItemJson) => AppMenuItemModel(
                  id: AppMenuItemModelId(appMenuItemJson['id']),
                  label: appMenuItemJson['label'],
                  icon: getIconByName(appMenuItemJson['icon']),
                  isDefault: appMenuItemJson['isDefault'] ?? false,
                ))
            .toList();

  static IconData getIconByName(String iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home;
      case 'info':
        return Icons.info;
      case 'design_services':
        return Icons.design_services;
      case 'contact_page':
        return Icons.contact_page;
      default:
        return Icons.question_mark;
    }
  }

  void setSelectedItem(AppMenuItemModelId id) {
    // if menu item with given id isn't found -> do nothing
    if (!items.any((item) => item.id == id)) {
      logger.info('Menu item with id: $id not found!');
      return;
    }

    for (var item in items) {
      if (item.id == id) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
    }
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString('currentBody', id.value));
    notifyListeners();
  }

  AppMenuItemModel getSelectedItem() {
    var selectedItems = items.where((item) => item.isSelected);
    if (selectedItems.isNotEmpty) return selectedItems.first;

    SharedPreferences.getInstance().then((prefs) {
      var savedMenuItemId = prefs.getString('currentBody');
      if (savedMenuItemId != null) {
        setSelectedItem(AppMenuItemModelId(savedMenuItemId));
      } else {
        setSelectedItem(getDefaultItem().id);
      }
    });

    // // return default item as selected, and set it selected,
    // // if there no selected item in menu
    // var defaultItems = items.where((item) => item.isDefault);
    // if (defaultItems.isNotEmpty) {
    //   var defaultItem = defaultItems.first;
    //   setSelectedItem(defaultItem.id);
    //   return defaultItem;
    // }

    // return first item if not selected nor default not found
    // if (items.isNotEmpty) return items.first;

    // TODO: probably need to refactor this to
    // something like MaybeAppMenuItemModel type
    return AppMenuItemModel(
        id: AppMenuItemModelId('loading'), label: ''); // workaround
  }

  AppMenuItemModel getDefaultItem() {
    if (items.isEmpty) {
      return AppMenuItemModel(id: AppMenuItemModelId(''), label: '');
    }
    final defaultItems = items.where((item) => item.isDefault).toList();
    return defaultItems.isNotEmpty ? defaultItems.first : items.first;
  }
}
