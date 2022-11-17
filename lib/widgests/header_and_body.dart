import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HeaderAndBody extends StatelessWidget {
  final String header;
  final String body;

  const HeaderAndBody({
    super.key,
    required this.header,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isPhone = screenSize.width <= ScreenConstants.phoneScreenWidth;

    return Padding(
      padding: EdgeInsets.only(
        left: !isPhone ? 24.0 : 8,
        bottom: !isPhone ? 24 : 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
              fontSize: !isPhone ? 28 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: !isPhone ? 16 : 8),
          Text(
            body,
            style: TextStyle(
                fontSize: !isPhone ? 20 : 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
