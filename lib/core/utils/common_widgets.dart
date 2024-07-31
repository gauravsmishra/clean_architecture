import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Returns a horizontal space of the given [space] width.
Widget hSpace(double space) {
  return SizedBox(
    width: space,
  );
}

/// Returns a vertical space of the given [space] height.
Widget vSpace(double space) {
  return SizedBox(
    height: space,
  );
}

/// Common Toast message widget
void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
