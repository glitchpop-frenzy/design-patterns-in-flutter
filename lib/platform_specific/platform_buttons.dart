import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformButton extends StatelessWidget {
  final String text;
  final Color materialColor;
  final Color materialTextColor;
  final VoidCallback? onPressed;

  const PlatformButton(
      {Key? key,
      required this.materialColor,
      required this.materialTextColor,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: kIsWeb || Platform.isAndroid
          ? MaterialButton(
              color: materialColor,
              textColor: materialTextColor,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              onPressed: onPressed,
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            )
          : CupertinoButton(
              color: Colors.black,
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
              onPressed: onPressed),
    );
  }
}
