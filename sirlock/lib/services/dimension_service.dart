import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage / 100;
}

double getScreenHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage / 100;
}
