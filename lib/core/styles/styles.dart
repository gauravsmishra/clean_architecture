import 'package:flutter/material.dart';

class Styles {
  static regularTextWidgetStyle(
      {double size = 16,
      double height = 1.2,
      Color? color,
      bool underLineNeeded = false,

      /// Dotted or Dashed
      TextDecorationStyle? textDecorationStyle,
      bool textoverFlow = false}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      overflow: !textoverFlow ? null : TextOverflow.ellipsis,
      height: height,
      color: color,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      decorationStyle: textDecorationStyle,
    );
  }

  static normalTextWidgetStyle(
      {double size = 16,
      double height = 1.2,
      Color? color,
      bool underLineNeeded = false,
      TextDecorationStyle? textDecorationStyle,
      double? decorationThickness,
      bool textoverFlow = false}) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontWeight: FontWeight.w400,
      color: color,
      overflow: !textoverFlow ? null : TextOverflow.ellipsis,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      decorationStyle: textDecorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  static mediumTextWidgetStyle(
      {double size = 16,
      double height = 1.2,
      Color? color,
      bool underLineNeeded = false,
      TextDecorationStyle? textDecorationStyle,
      double? decorationThickness,
      bool textoverFlow = false}) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontWeight: FontWeight.w500,
      color: color,
      overflow: !textoverFlow ? null : TextOverflow.ellipsis,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      decorationThickness: decorationThickness,

      /// Dotted or Dashed underline
      decorationStyle: textDecorationStyle,
    );
  }

  static semiBoldTextWidgetStyle({
    double size = 16,
    double height = 1.2,
    Color? color,
    bool underLineNeeded = false,
    TextDecorationStyle? textDecorationStyle,
    double? decorationThickness,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontWeight: FontWeight.w600,
      color: color,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      decorationThickness: decorationThickness,

      /// Dotted or Dashed underline
      decorationStyle: textDecorationStyle,
    );
  }

  static boldTextWidgetStyle({
    double size = 16,
    double height = 1.2,
    Color? color,
    bool underLineNeeded = false,
    TextDecorationStyle? textDecorationStyle,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontWeight: FontWeight.bold,
      color: color,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,

      /// Dotted or Dashed underline
      decorationStyle: textDecorationStyle,
    );
  }

  static extraBoldTextWidgetStyle({
    double size = 16,
    double height = 1.2,
    Color? color,
    bool underLineNeeded = false,
    TextDecorationStyle? textDecorationStyle,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontWeight: FontWeight.w800,
      color: color,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      decorationStyle: textDecorationStyle,
    );
  }
}
