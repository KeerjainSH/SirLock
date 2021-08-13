import 'package:flutter/material.dart';

import 'pages/dashboard/dashboard_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/dashboard': (context) => Dashboard(),
    },
    initialRoute: '/dashboard',
  ));
}
