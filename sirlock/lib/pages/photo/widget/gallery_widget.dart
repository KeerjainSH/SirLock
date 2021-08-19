import 'package:flutter/material.dart';
import 'package:sirlock/models/firebase_file_model.dart';
import 'package:sirlock/pages/photo/widget/photo_view_widget.dart';
import 'package:sirlock/services/dimension_service.dart';

class Gallery extends StatelessWidget {
  const Gallery({
    Key? key,
    required this.files,
  }) : super(key: key);

  final Future<List<FirebaseFile>> files;

  @override
  Widget build(BuildContext context) {
    final double _space = getScreenWidth(context, 1);

    return FutureBuilder<List<FirebaseFile>>(
      future: files,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            } else {
              final images = _generateList(context, snapshot.data!);
              return Padding(
                padding: EdgeInsets.only(
                    top: getScreenHeight(context, 15) + _space,
                    left: _space,
                    right: _space),
                child: SizedBox.expand(
                  child: SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: _space,
                      children: images,
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }

  List<Widget> _generateList(BuildContext context, List<FirebaseFile> list) {
    final size = getScreenWidth(context, 19);
    final List<Widget> items = [];

    for (int i = 0; i < list.length; i++) {
      items.add(_generateItem(i, size, context, list));
    }

    return items;
  }

  Widget _generateItem(
      int index, double size, BuildContext context, List<FirebaseFile> list) {
    return Container(
      width: size,
      height: size,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  PhotoView(images: list, index: index)));
        },
        child: Hero(
          tag: list[index].url,
          child: Image.network(
            list[index].url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
