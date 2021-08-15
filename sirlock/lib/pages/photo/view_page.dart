import 'package:flutter/material.dart';
import 'package:sirlock/pages/photo/widget/gallery_widget.dart';
import 'package:sirlock/pages/shared_widget/background_widget.dart';
import 'package:sirlock/pages/shared_widget/header_widget.dart';
import 'package:sirlock/services/dimension_service.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final List<String> imageList = [
    'assets/image/logo.png',
    'assets/image/reboot.png',
    'assets/image/shutdown.png',
    'assets/image/sound.png',
    'assets/image/streaming.png',
    'assets/image/unlock.png',
    'assets/image/test.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(context),
    );
  }

  Widget _layout(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Column(
          children: [
            const Header(text: 'View Image'),
            Divider(
              height: getScreenHeight(context, 10),
            ),
            Gallery(imageList: imageList),
          ],
        ),
      ],
    );
  }
}
