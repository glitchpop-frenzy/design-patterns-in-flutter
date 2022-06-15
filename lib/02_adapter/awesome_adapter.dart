import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AwesomeAdapter extends StatelessWidget {
  const AwesomeAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor2,
      appBar: AppBar(
        backgroundColor: accentButtonBgColor,
        title: const Text(
          'Awesome Adapter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
