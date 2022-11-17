import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BodyHeader2 extends StatelessWidget {
  final bool bold;
  final String textToDisplay;

  const BodyHeader2({super.key, this.textToDisplay = '', this.bold = false});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Text(
      textToDisplay,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: screenSize.width > ScreenConstants.phoneScreenWidth ? 28 : 16,
      ),
    );
  }
}
