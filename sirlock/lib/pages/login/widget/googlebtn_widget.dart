import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sirlock/services/auth_service.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      text: 'Login with Google',
      icon: FontAwesomeIcons.google,
      onPressed: () {
        final provider = Provider.of<Auth>(context, listen: false);
        provider.googleLogin();
      },
      backgroundColor: Color(0xffFF7971),
    );
  }
}
