import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../models/services_model.dart';
import '../models/text_block_model.dart';

import './vertical_text.dart';
import './body_header_1.dart';
import './body_header_2.dart';
import './header_and_body.dart';

class Services extends StatelessWidget {
  static const appMenuItemModelId = 'services';

  const Services({super.key});

  Widget textBlock(TextBlockModel model) {
    return HeaderAndBody(
      header: model.header,
      body: model.body,
    );
  }

  Widget groupTextBlocks(ServicesModel model, Size screenSize) {
    if (screenSize.width > 900) {
      List<Widget> twoTextBlocksInRow = [];
      for (var i = 0; i < model.textBlocks.length; i += 2) {
        twoTextBlocksInRow.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: textBlock(model.textBlocks[i])),
            i + 1 < model.textBlocks.length
                ? Expanded(child: textBlock(model.textBlocks[i + 1]))
                : Expanded(child: SizedBox(width: screenSize.width * 0.1))
          ],
        ));
      }
      return Column(
        children: [...twoTextBlocksInRow],
      );
    }
    return Column(
      children: [
        ...model.textBlocks.map((tBlock) => textBlock(tBlock)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<ServicesModel>(
      builder: ((context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyHeader1(
                textToDisplay: value.header_1,
              ),
              Row(
                children: [
                  Expanded(
                    child: BodyHeader2(
                      textToDisplay: value.header_2,
                      bold: true,
                    ),
                  ),
                  screenSize.width > 900
                      ? const Expanded(child: SizedBox(width: 8))
                      : const SizedBox(width: 0),
                ],
                // ],
              ),
              SizedBox(
                  height: screenSize.width > ScreenConstants.phoneScreenWidth
                      ? 48
                      : 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalText(textToDisplay: value.verticalText),
                  Expanded(
                    child: groupTextBlocks(value, screenSize),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
