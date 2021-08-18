import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    Key? key,
    required this.onclick,
  }) : super(key: key);

  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      text: 'Login with Google',
      icon: FontAwesomeIcons.google,
      onPressed: onclick,
      backgroundColor: Color(0xffFF7971),
    );
  }
}
