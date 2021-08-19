import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sirlock/models/firebase_file_model.dart';
import 'package:sirlock/pages/shared/background_decoration.dart';
import 'package:sirlock/services/dimension_service.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);

  final List<FirebaseFile> images;
  final int index;

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(initialPage: widget.index);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.images[_currentIndex].name),
        centerTitle: true,
        flexibleSpace: Container(decoration: Background_Decoration()),
        toolbarHeight: getScreenHeight(context, 10),
      ),
      body: PhotoViewGallery.builder(
        itemCount: widget.images.length,
        pageController: _pageController,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              widget.images[index].url,
            ),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            heroAttributes:
                PhotoViewHeroAttributes(tag: widget.images[index].url),
          );
        },
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        // enableRotation: true,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 30.0,
            height: 30.0,
          ),
        ),
      ),
    );
  }
}
