import 'package:flutter/material.dart';
import 'package:sirlock/services/dimension_service.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: getScreenHeight(context, 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.teal.shade100, Colors.blue.shade900],
              ),
            )),
      ],
    );
  }
}
