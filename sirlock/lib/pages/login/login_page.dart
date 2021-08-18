import 'package:flutter/material.dart';
import 'package:sirlock/pages/login/widget/googlebtn_widget.dart';
import 'package:sirlock/services/auth_service.dart';
import 'package:sirlock/services/dimension_service.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _layout(context);
  }

  Widget _layout(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Auth(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/logo.png',
                height: getScreenHeight(context, 35)),
            Divider(
              height: getScreenHeight(context, 5),
              color: Colors.white,
            ),
            GoogleBtn(),
            Divider(
              height: getScreenHeight(context, 15),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
