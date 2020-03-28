import 'package:flutter/material.dart';

class AppTheme {
  final Color primaryColor = Color(0xFFE32F04);
  final Color orangeLevel_1 = Color(0xFFD2BBB5);
  final Color orangeLevel_2 = Color(0xFFD38E70);
  final Color mainSearchColor = Color(0xFFF17226);
  List<Color> mainColorGradient = [
    Color(0xfffc5e36),
    Color(0xfffb3504),
  ];
  final Color iconsWhiteColor = Colors.white;
  final Color iconsBlackColor = Colors.black.withOpacity(0.6);
  final TextStyle popUpMenuTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  final TextStyle mainPopUpMenuTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  final TextStyle mainTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 32,
      fontFamily: 'Oxygen');
}
