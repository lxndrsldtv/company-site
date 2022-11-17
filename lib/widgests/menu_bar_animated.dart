import 'package:logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './menu_items.dart';

import '../utils/constants.dart';
import '../models/app_menu_model.dart';

class MenuBarAnimated extends StatefulWidget {
  const MenuBarAnimated({super.key});

  @override
  State<MenuBarAnimated> createState() => _MenuBarAnimatedState();
}

class _MenuBarAnimatedState extends State<MenuBarAnimated>
    with TickerProviderStateMixin {
  final logger = Logger('_MenuBarAnimatedState');
  Duration animationDuration = const Duration(milliseconds: 1000);
  final EdgeInsets _iconMenuPadding = const EdgeInsets.all(0.0);
  final EdgeInsets _textMenuPadding = const EdgeInsets.only(left: 8.0);
  MenuItemKind _menuItemKind = MenuItemKind.text;

  AppMenuModel _appMenuModel = AppMenuModel.empty();

  @override
  void didChangeDependencies() {
    logger.info('didChangeDependencies');
    super.didChangeDependencies();

    logger.info('didChangeDependencies '
        'add post frame callback');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      logger.info('postFrameCallback: '
          'execute post frame callback');
      calculateMenuItemRenderAttributes(
          _appMenuModel,
          _menuItemKind == MenuItemKind.text
              ? _textMenuPadding
              : _iconMenuPadding);
      setState(() {});
    });
  }

  Size getSizeByGlobalKey(GlobalKey? globalKey) {
    final RenderBox? renderBox =
        globalKey?.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? const Size(0.0, 0.0);
  }

  void calculateMenuItemRenderAttributes(
      AppMenuModel appMenuModel, EdgeInsets menuItemPadding) {
    if (appMenuModel.items.isEmpty) return;

    double leftOffset = 0.0;
    for (var index = 0; index < appMenuModel.items.length; index++) {
      leftOffset += menuItemPadding.left;

      var currentElement = appMenuModel.items.elementAt(index);
      currentElement.leftOffset = leftOffset;
      currentElement.size = getSizeByGlobalKey(currentElement.globalKey);

      logger.info(
        'calculateSize '
        'appMenuItem.id:${currentElement.id} '
        'size: ${currentElement.size.toString()}, '
        'leftOffset: ${currentElement.leftOffset}',
      );

      leftOffset += currentElement.size.width + menuItemPadding.right;
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.info('build');

    final screenSize = MediaQuery.of(context).size;
    _menuItemKind = screenSize.width > ScreenConstants.phoneScreenWidth
        ? MenuItemKind.text
        : MenuItemKind.icon;

    _appMenuModel = Provider.of<AppMenuModel>(context);

    return Row(
      children: [
        Image.asset(
          _appMenuModel.imageLogoAssetPath,
          height: screenSize.width * 0.1,
          fit: BoxFit.scaleDown,
        ),
        const Spacer(),
        Stack(
          children: [
            AnimatedPositioned(
              duration: animationDuration,
              left: _appMenuModel.getSelectedItem().leftOffset,
              width: _appMenuModel.getSelectedItem().size.width,
              height: _appMenuModel.getSelectedItem().size.height,
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0x22f185b2),
                  border: Border(
                    bottom: BorderSide(
                      // color: Color(0x88f185b2),
                      color: Color(0xff000000),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            MenuItems(
              kind: _menuItemKind,
              padding: _menuItemKind == MenuItemKind.text
                  ? _textMenuPadding
                  : _iconMenuPadding,
            )
          ],
        )
      ],
    );
  }
}
