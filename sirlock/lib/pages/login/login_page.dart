import 'package:flutter/material.dart';
import 'package:sirlock/pages/login/widget/googlebtn_widget.dart';
import 'package:sirlock/services/dimension_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(context),
    );
  }

  Widget _layout(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/logo.png',
              height: getScreenHeight(context, 35)),
          Divider(
            height: getScreenHeight(context, 5),
            color: Colors.white,
          ),
          GoogleBtn(onclick: () {}),
          Divider(
            height: getScreenHeight(context, 15),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
