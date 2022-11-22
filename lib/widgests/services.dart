import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../utils/constants.dart';
import '../models/services_model.dart';

import './vertical_text.dart';
import './body_header_1.dart';
import './body_header_2.dart';

import '../providers/app_configuration_provider.dart';

class Services extends StatelessWidget {
  static const appMenuItemModelId = 'services';

  const Services({super.key});

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
                    child: Consumer<AppConfigurationProvider>(
                      builder: (context, appConfiguration, child) =>
                          getRowsOfTextBlocks(
                        blocks: value.textBlocks,
                        blocksPerRow: screenSize.width > 900
                            ? appConfiguration.maxTextBlocksPerRowAtServices
                            : 1,
                        useEmptyBlocks: true,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
