import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  static const appMenuItemModelId = 'loading';

  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: screenSize.height - screenSize.width * 0.1 /* height of menu bar */,
      child: Center(
        child: SizedBox(
          width: screenSize.width * 0.1,
          height: screenSize.width * 0.1,
          child: const CircularProgressIndicator(
            // color: Colors.pink.shade200,
            color: Color(0x22f185b2),
          ),
        ),
      ),
    );
  }
}
