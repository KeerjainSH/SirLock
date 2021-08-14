import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sirlock/services/database.dart';

Function alarm() {
  return () {
    _createToast('Turn on the Alarm');
    Database().updateCommand(3);
  };
}

Function unlock() {
  return () {
    _createToast('Unlocking the Door');
    Database().updateCommand(4);
  };
}

Function shutdown() {
  return () {
    _createToast('Shutting down PI');
    Database().updateCommand(1);
  };
}

Function reboot() {
  return () {
    _createToast('Rebooting the PI');
    Database().updateCommand(2);
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
