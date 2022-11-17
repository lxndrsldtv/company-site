import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BodyHeader1 extends StatelessWidget {
  final String textToDisplay;

  const BodyHeader1({super.key, this.textToDisplay = ''});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
          bottom: screenSize.width > ScreenConstants.phoneScreenWidth ? 16 : 8),
      child: Text(
        textToDisplay,
        style: TextStyle(
            fontSize: screenSize.width > ScreenConstants.phoneScreenWidth ? 56 : 20),
      ),
    );
  }
}
