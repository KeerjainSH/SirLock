import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'pages/dashboard/dashboard_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/dashboard': (context) => Dashboard(),
    },
    initialRoute: '/dashboard',
  ));
}
