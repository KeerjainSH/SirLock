import 'package:flutter/material.dart';
import 'package:sirlock/models/firebase_file_model.dart';
import 'package:sirlock/pages/photo/widget/gallery_widget.dart';
import 'package:sirlock/pages/shared_widget/background_widget.dart';
import 'package:sirlock/pages/shared_widget/header_widget.dart';
import 'package:sirlock/services/dimension_service.dart';
import 'package:sirlock/services/storage_db_service.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = StorageDB.listAll('');
  }

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
              height: getScreenHeight(context, 11),
            ),
            Gallery(files: futureFiles),
          ],
        ),
      ],
    );
  }
}
