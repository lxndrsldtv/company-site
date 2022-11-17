import 'package:flutter/material.dart';

import '../utils/constants.dart';

class VerticalText extends StatelessWidget {
  final String textToDisplay;

  const VerticalText({super.key, required this.textToDisplay});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isPhone = screenSize.width <= ScreenConstants.phoneScreenWidth;

    Widget buildText(String text, Color color) {
      return Text(text,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: !isPhone ? 24 : 16,
              color: color,
              fontWeight: FontWeight.bold));
    }

    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        margin: EdgeInsets.only(bottom: !isPhone ? 24 : 8),
        color: Colors.black,
        child: Row(
          children: [
            buildText('________', Colors.black),
            buildText(textToDisplay, const Color(0xfff185b2)),
            buildText('____', Colors.black),
          ],
        ),
      ),
      // ),
    );
  }
}
