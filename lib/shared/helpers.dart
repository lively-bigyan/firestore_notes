import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.grey[600],
        toastLength: Toast.LENGTH_SHORT);
  }
}

final helpers = Helpers();
