import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../models/app_menu_model.dart';

import './home.dart';
import './about.dart';
import './contact.dart';
import './loading.dart';
import './services.dart';
import './menu_bar_animated.dart';

class SliverBaseFrame extends StatefulWidget {
  const SliverBaseFrame({super.key});

  @override
  State<SliverBaseFrame> createState() => _SliverBaseFrameState();
}

class _SliverBaseFrameState extends State<SliverBaseFrame> {
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: screenSize.width * 0.1,
            ),
            sliver: SliverAppBar(
            expandedHeight: screenSize.width * 0.1,
            elevation: 0.0,
            backgroundColor: Colors.white,
            floating: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1.0,
              title: MenuBarAnimated(),
            ),
          ),),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: screenSize.width * 0.1,
            ),
            sliver: SliverToBoxAdapter(
              child: Consumer<AppMenuModel>(
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
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
