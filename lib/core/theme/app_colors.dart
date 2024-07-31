import 'package:flutter/material.dart';

class AppColors {
  static const Color screenBackgroundColor = Color(0xFFF4F7F8);
  static const Color textBlackColor = Color(0xff000000);
  static const Color textGreyColor = Color(0xff666666);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color redColor = Color(0xffFB000F);
  static const Color textGreyColor2 = Color(0xff707070);
  static const Color appleLogoBC = Color(0xff211F1F);
  static const Color textLightColor = Color(0xff8F8F8F);
  static const Color grey50Color = Color(0xE2192B0D);
  static const Color greyBoxColor = Color(0xffF2F2F2);
  static const Color redBgColor = Color(0xffD92F3C);
  static const Color redBorderColor = Color(0xffFB000F);
  static const Color orangeBgColor = Color(0xffFFA500);
  static const Color textFieldFillColor = Color(0xffF6F5F8);
  static const Color blackBackgroundColor = Color(0xff0D0D0D);
  static const Color lightBlackBackgroundColor = Color(0xff1C1C1C);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
