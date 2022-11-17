import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_menu_model.dart';
import '../models/app_menu_item_model.dart';

enum MenuItemKind {
  text,
  icon,
}

class MenuItems extends StatelessWidget {
  final MenuItemKind kind;
  final EdgeInsets padding;

  const MenuItems({
    super.key,
    required this.kind,
    this.padding = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    AppMenuModel appMenuModel = Provider.of<AppMenuModel>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: buildMenuItemWidgetList(appMenuModel),
    );
  }

  List<Widget> buildMenuItemWidgetList(AppMenuModel appMenuModel) {
    final appMenuItemModels = appMenuModel.items;
    final menuItemWidgets = appMenuItemModels.map<Widget>((menuItemModel) {
      menuItemModel.globalKey = GlobalKey(debugLabel: menuItemModel.label);
      return buildMenuItemWidget(
        appMenuItemModel: menuItemModel,
        menuItemPressHandler: () =>
            appMenuModel.setSelectedItem(menuItemModel.id),
      );
    });
    return menuItemWidgets.toList();
  }

  Widget buildMenuItemWidget({
    required AppMenuItemModel appMenuItemModel,
    required VoidCallback menuItemPressHandler,
  }) {
    return kind == MenuItemKind.text
        ? buildTextMenuItemWidget(
            appMenuItemModel: appMenuItemModel,
            menuItemPressHandler: menuItemPressHandler,
          )
        : buildIconMenuItemList(
            appMenuItemModel: appMenuItemModel,
            menuItemPressHandler: menuItemPressHandler,
          );
  }

  Widget buildTextMenuItemWidget({
    required AppMenuItemModel appMenuItemModel,
    required VoidCallback menuItemPressHandler,
  }) {
    return Padding(
      padding: padding,
      child: InkWell(
        key: appMenuItemModel.globalKey,
        hoverColor: const Color(0x11f185b2),
        focusColor: const Color(0x11f185b2),
        splashColor: const Color(0x11f185b2),
        highlightColor: const Color(0x11f185b2),
        onTap: menuItemPressHandler,
        child: Text(
          appMenuItemModel.label,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  Widget buildIconMenuItemList({
    required AppMenuItemModel appMenuItemModel,
    required VoidCallback menuItemPressHandler,
  }) {
    return Padding(
      padding: padding,
      child: IconButton(
        key: appMenuItemModel.globalKey,
        onPressed: menuItemPressHandler,
        icon: Icon(appMenuItemModel.icon),
        // color: currentButtonIndex == buttonNameToIndex(buttonName)
        //     ? const Color(0xfff185b2)
        //     : const Color(0x88f185b2),
        hoverColor: const Color(0x11f185b2),
        focusColor: const Color(0x11f185b2),
        splashColor: const Color(0x11f185b2),
        highlightColor: const Color(0x11f185b2),
        padding: const EdgeInsets.all(0),
        // alignment: Alignment.centerRight,
      ),
    );
  }
}
