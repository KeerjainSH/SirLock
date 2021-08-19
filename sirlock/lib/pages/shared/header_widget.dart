import 'package:flutter/material.dart';
import 'package:sirlock/services/dimension_service.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.text,
    required this.height,
  }) : super(key: key);

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Column(
        children: [_headerText(context, text, getScreenHeight(context, 5))],
      ),
    );
  }

  Padding _headerText(BuildContext context, String text, double top) {
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
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
