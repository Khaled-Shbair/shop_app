import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin helpers {
  void showSnackBar({required String message, bool error = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
/*
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          top: 10,
          bottom: 10,
        ),
      ),
    );
  }
  */
