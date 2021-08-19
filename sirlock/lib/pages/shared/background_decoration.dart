import 'package:flutter/material.dart';

BoxDecoration Background_Decoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.teal.shade100, Colors.blue.shade900],
    ),
  );
}
