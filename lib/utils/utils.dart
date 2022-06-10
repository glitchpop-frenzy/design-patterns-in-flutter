import 'package:flutter/material.dart';

const Color primaryBgColor = Color(0xFF1B1D21);
const Color primaryBgColor2 = Color(0xFF262A33);
const Color accentButtonBgColor = Color(0xFF8A8F99);
const Color accentColor2 = Color(0xFF515866);

//
const buttonSep = SizedBox(
  height: 10,
);

Widget pillButton(
    {required Widget child,
    required Function() onButtonPress,
    required BuildContext context}) {
  return ElevatedButton(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
      backgroundColor: MaterialStateProperty.all(accentButtonBgColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      fixedSize: MaterialStateProperty.all(
        Size(MediaQuery.of(context).size.width, 65),
      ),
    ),
    child: child,
    onPressed: onButtonPress,
  );
}
