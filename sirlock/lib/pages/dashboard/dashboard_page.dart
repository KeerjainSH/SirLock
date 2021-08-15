import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sirlock/pages/shared_widget/background_widget.dart';
import 'package:sirlock/pages/dashboard/widget/menu_widget.dart';
import 'package:sirlock/pages/shared_widget/header_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(context),
    );
  }

  Widget _layout(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Column(
          children: [
            const Header(text: 'My Dashboard\nSirlock'),
            const GridMenu(),
          ],
        ),
      ],
    );
  }
}
