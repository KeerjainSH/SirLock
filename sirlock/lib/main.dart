import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sirlock/pages/login/login_page.dart';
import 'package:sirlock/pages/photo/view_page.dart';
import 'pages/dashboard/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    routes: {
      '/login': (context) => Login(),
      '/dashboard': (context) => Dashboard(),
      '/view': (context) => View(),
    },
    initialRoute: '/login',
  ));
}
