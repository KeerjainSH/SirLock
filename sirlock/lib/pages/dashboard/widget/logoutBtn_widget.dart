import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:sirlock/services/auth_service.dart';
import 'package:sirlock/services/dimension_service.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, getScreenHeight(context, 5), getScreenHeight(context, 5), 0),
      child: Container(
        alignment: Alignment.topRight,
        height: 30,
        child: SignInButtonBuilder(
          innerPadding: const EdgeInsets.all(0),
          width: 80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          text: 'Logout',
          onPressed: () {
            final provider = Provider.of<Auth>(context, listen: false);
            provider.googleLogout();
          },
          backgroundColor: Color(0xffFF7971),
        ),
      ),
    );
  }
}
