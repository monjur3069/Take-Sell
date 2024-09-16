import 'package:flutter/material.dart';

const String taka = '৳';

// const Color primaryColor = Color(0xffFFEB3B);

// const Color primaryColor = Color(0xffFF9033);
const Color primaryColor = Color(0xffF26324);
const Color scaffoldBg = Color(0xFFE1E1F1);
const Color primaryWhite = Colors.white70;
const Color primaryBlack = Colors.black;
const Color primaryGrey = Color(0xFF9B9B9B);
const Color primaryGreen = Color(0xFF0DBE02);
const Color primaryRed = Color(0xFFDB3022);

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(255, 213, 78, .1),
  100: const Color.fromRGBO(255, 213, 78, .2),
  200: const Color.fromRGBO(255, 213, 78, .3),
  300: const Color.fromRGBO(255, 213, 78, .4),
  400: const Color.fromRGBO(255, 213, 78, .5),
  500: const Color.fromRGBO(255, 213, 78, .6),
  600: const Color.fromRGBO(255, 213, 78, .7),
  700: const Color.fromRGBO(255, 213, 78, .8),
  800: const Color.fromRGBO(255, 213, 78, .9),
  900: const Color.fromRGBO(255, 213, 78, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.amber;

  static MaterialColor customSwatchColor =
  MaterialColor(0xFFFFD54E, _swatchOpacity);
}
