import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../utils/constants.dart';

import '../models/about_model.dart';

import './body_header_1.dart';
import './body_header_2.dart';
import './vertical_text.dart';

import '../providers/app_configuration_provider.dart';

class About extends StatelessWidget {
  static const appMenuItemModelId = 'about';

  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<AboutModel>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyHeader1(textToDisplay: value.header_1),
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
          ),
          SizedBox(
            height:
                screenSize.width > ScreenConstants.phoneScreenWidth ? 24 : 8,
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: BodyHeader2(
                  textToDisplay: value.header_3,
                ),
              ),
              screenSize.width > 900
                  ? const Flexible(
                      flex: 1,
                      child: SizedBox(width: 8),
                    )
                  : const SizedBox(width: 0)
            ],
          ),
          SizedBox(
            height:
                screenSize.width > ScreenConstants.phoneScreenWidth ? 48 : 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalText(textToDisplay: value.verticalText),
              Expanded(
                child: Consumer<AppConfigurationProvider>(
                  builder: (context, appConfiguration, child) =>
                      getRowsOfTextBlocks(
                          blocks: value.textBlocks,
                          blocksPerRow: screenSize.width > 900
                              ? appConfiguration.maxTextBlocksPerRowAtAbout
                              : 1,
                          useEmptyBlocks: true,
                          lastBlockPadding: EdgeInsets.only(
                            right: screenSize.width * 0.1,
                          )),
                ),
              ),
              // ),
            ],
          )
        ],
        // ),
      ),
    );
  }
}
