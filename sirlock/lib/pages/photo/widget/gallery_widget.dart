import 'package:flutter/material.dart';
import 'package:sirlock/pages/photo/widget/photo_view_widget.dart';
import 'package:sirlock/services/dimension_service.dart';

class Gallery extends StatelessWidget {
  final List<String> imageList;

  const Gallery({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  Widget _generateItem(int index, double size, BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: FittedBox(
        fit: BoxFit.fill,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Scaffold(
                      body: PhotoView(
                          imageList: imageList,
                          tag: imageList[index],
                          index: index),
                    )));
          },
          child: Hero(
            tag: imageList[index],
            child: Image(
              image: AssetImage(imageList[index]),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateList(BuildContext context) {
    final List<Widget> items = [];
    final size = getScreenWidth(context, 19);

    for (int i = 0; i < imageList.length; i++) {
      items.add(_generateItem(i, size, context));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // direction: Axis.vertical,
      spacing: getScreenWidth(context, 1),
      children: _generateList(context),
    );
  }
}
