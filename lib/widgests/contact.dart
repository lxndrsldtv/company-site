import 'package:flutter/material.dart';
import 'package:hrw/data/app_data.dart';
import 'package:provider/provider.dart';
import 'package:webviewx/webviewx.dart';

import '../models/contact_model.dart';

import './body_header_1.dart';
import './body_header_2.dart';

class Contact extends StatefulWidget {
  static const appMenuItemModelId = 'contacts';

  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  GlobalKey? contactTextColumnGlobalKey;
  Size contactTextColumnSize = const Size(0.0, 0.0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = contactTextColumnGlobalKey?.currentContext
          ?.findRenderObject() as RenderBox?;
      contactTextColumnSize = renderBox?.size ?? const Size(0.0, 0.0);
      setState(() {});
    });
  }

  List<Widget> contactTexts({
    required ContactModel model,
    double divHeight = 0,
  }) {
    return [
      BodyHeader2(textToDisplay: model.addressHeader, bold: true),
      BodyHeader2(textToDisplay: model.address),
      SizedBox(height: divHeight),
      BodyHeader2(textToDisplay: model.contactHeader, bold: true),
      BodyHeader2(textToDisplay: model.contact),
    ];
  }

  double getRightPadding({
    required double maxScreenWidth,
    required double currentScreenWidth,
  }) {
    var result = currentScreenWidth -
        (currentScreenWidth * (maxScreenWidth / currentScreenWidth * 0.5));
    if (result > maxScreenWidth / 2) {
      result = maxScreenWidth / 2;
    }
    return result > 0 ? result : 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenWidthNoPadding = screenWidth - screenWidth * 0.2;

    const maxScreenWidth = 2000;
    const maxScreenSizeNoPadding = maxScreenWidth - maxScreenWidth * 0.2;

    contactTextColumnGlobalKey =
        GlobalKey(debugLabel: 'contactTextColumnGlobalKey');

    return Consumer<ContactModel>(
      builder: ((context, model, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyHeader1(textToDisplay: model.header_1),
              Padding(
                padding: EdgeInsets.only(
                    right: getRightPadding(
                  maxScreenWidth: maxScreenSizeNoPadding,
                  currentScreenWidth: screenWidthNoPadding,
                )),
                child: BodyHeader2(
                  textToDisplay: model.header_2,
                  bold: true,
                ),
              ),
              const SizedBox(height: 32),
              screenSize.width > 900
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            key: contactTextColumnGlobalKey,
                            padding: const EdgeInsets.only(right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  contactTexts(model: model, divHeight: 64),
                            ),
                          ),
                        ),
                        Expanded(
                          child: WebViewX(
                            initialContent: webYandexMap,
                            initialSourceType: SourceType.html,
                            height: contactTextColumnSize.height,
                            width: contactTextColumnSize.width,
                          ),
                        ),
                        // ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...contactTexts(model: model, divHeight: 32),
                        const SizedBox(height: 32),
                        WebViewX(
                          initialContent: webYandexMap,
                          initialSourceType: SourceType.html,
                          height: screenWidth - screenWidth * 0.2,
                          width: screenWidth,
                        ),
                      ],
                    ),
              const SizedBox(height: 32),
            ],
          )),
    );
  }
}
