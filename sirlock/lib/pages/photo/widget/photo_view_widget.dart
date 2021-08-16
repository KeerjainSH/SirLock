import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sirlock/models/firebase_file_model.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);

  final List<FirebaseFile> images;
  final int index;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: index);

    return PhotoViewGallery.builder(
      itemCount: images.length,
      pageController: _pageController,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(
            images[index].url,
          ),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          heroAttributes: PhotoViewHeroAttributes(tag: images[index].url),
        );
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
    );
  }
}
