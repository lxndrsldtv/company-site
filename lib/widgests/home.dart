import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../models/home_model.dart';

import './body_header_1.dart';
import './body_header_2.dart';
import './vertical_text.dart';

class Home extends StatelessWidget {
  static const appMenuItemModelId = 'home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<HomeModel>(
      builder: (context, value, child) {
        return Column(
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
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalText(textToDisplay: value.verticalText),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.header_3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.width >
                                  ScreenConstants.phoneScreenWidth
                              ? 32
                              : 20,
                        ),
                      ),
                      BodyHeader2(
                        textToDisplay: value.content,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
