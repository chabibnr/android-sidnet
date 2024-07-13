import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

enum SnackBarType {
  danger,
  success,
  primary,
}

showSnackBar({required BuildContext context, required String title, required String caption, required GlobalKey<ScaffoldState> key, SnackBarType type = SnackBarType.danger}) {
  return Flushbar(
    title: title,
    message: caption,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: Colors.red,
  )..show(context);
}
