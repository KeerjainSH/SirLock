import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Function alarm() {
  return () {
    _createToast('Turn on the Alarm');
  };
}

Function unlock() {
  return () {
    _createToast('Unlocking the Door');
  };
}

Function shutdown() {
  return () {
    _createToast('Shutting down PI');
  };
}

Function reboot() {
  return () {
    _createToast('Rebooting the PI');
  };
}

Future<bool?> _createToast(String text) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0);
}
