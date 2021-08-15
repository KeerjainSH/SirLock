import 'package:flutter/material.dart';
import 'package:sirlock/services/dimension_service.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(context, 20),
      width: double.infinity,
      child: Column(
        children: [
          _headerText(context, 'My Dashboard\nSirlock',
              getScreenHeight(context, 2.7), getScreenHeight(context, 5))
        ],
      ),
    );
  }

  Padding _headerText(
      BuildContext context, String text, double size, double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getScreenWidth(context, 5), top, getScreenWidth(context, 5), 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
              fontSize: size),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
