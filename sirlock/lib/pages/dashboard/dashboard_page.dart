import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirlock/pages/dashboard/widget/logoutBtn_widget.dart';
import 'package:sirlock/pages/login/login_page.dart';
import 'package:sirlock/pages/dashboard/widget/background_widget.dart';
import 'package:sirlock/pages/dashboard/widget/menu_widget.dart';
import 'package:sirlock/pages/shared/header_widget.dart';
import 'package:sirlock/services/auth_service.dart';
import 'package:sirlock/services/dimension_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => Auth(),
      child: _streamBuilder(),
    ));
  }

  StreamBuilder _streamBuilder() {
    return StreamBuilder(
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
    );
  }

  Widget _layout(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Stack(
      children: [
        const Background(),
        Column(
          children: [
            Header(
                text: 'My Dashboard\nSirlock\nHalo, ${user.displayName} !',
                height: getScreenHeight(context, 20)),
            const GridMenu(),
          ],
        ),
        LogoutBtn(),
      ],
    );
  }
}
