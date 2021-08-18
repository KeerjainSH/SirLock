import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sirlock/pages/login/login_page.dart';
import 'package:sirlock/pages/shared_widget/background_widget.dart';
import 'package:sirlock/pages/dashboard/widget/menu_widget.dart';
import 'package:sirlock/pages/shared_widget/header_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return _layout(context);
          } else {
            return Login();
          }
        },
      ),
    );
  }

  Widget _layout(BuildContext context) {
    final name = FirebaseAuth.instance.currentUser!.displayName;
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
