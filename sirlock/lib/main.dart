import 'package:flutter/material.dart';
import 'package:sirlock/pages/photo/view_page.dart';
import 'pages/dashboard/dashboard_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/dashboard': (context) => Dashboard(),
      '/view': (context) => const View(),
    },
    initialRoute: '/dashboard',
  ));
}
