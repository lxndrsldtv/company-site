import 'package:flutter/material.dart';

class ResourceUnavailable extends StatelessWidget {
  const ResourceUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Resource Unavailable ...',
        style: TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
      )),
    );
  }
}
