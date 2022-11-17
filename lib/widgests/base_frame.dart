import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../models/app_menu_model.dart';

import './home.dart';
import './about.dart';
import './contact.dart';
import './loading.dart';
import './services.dart';
import './menu_bar_animated.dart';

class BaseFrame extends StatefulWidget {
  const BaseFrame({super.key});

  @override
  State<BaseFrame> createState() => _BaseFrameState();
}

class _BaseFrameState extends State<BaseFrame> {
  final logger = Logger('_BaseFrameState');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget getBody(AppMenuModel appMenuModel) {
    switch (appMenuModel.getSelectedItem().id.value) {
      case Home.appMenuItemModelId:
        return const Home();
      case About.appMenuItemModelId:
        return const About();
      case Services.appMenuItemModelId:
        return const Services();
      case Contact.appMenuItemModelId:
        return const Contact();
      case Loading.appMenuItemModelId:
        return const Loading();
      default:
        return const Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.info('build');

    final screenSize = MediaQuery.of(context).size;
    final bool isPhone = screenSize.width <= ScreenConstants.phoneScreenWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: screenSize.width * 0.1, right: screenSize.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: isPhone ? 32.0 : 0.0),
              const MenuBarAnimated(),
              SizedBox(width: 0.0, height: isPhone ? 32.0 : 0.0),
              Consumer<AppMenuModel>(
                builder: (context, appMenuModel, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    layoutBuilder: (currentChild, previousChildren) {
                      // default layout builder lead to jumping content
                      return Stack(
                        alignment: Alignment.topLeft,
                        children: <Widget>[
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      );
                    },
                    child: getBody(appMenuModel),
                  );
                },
                // child:
              ),
            ],
          ),
        ),
      ),
    );
  }
}
