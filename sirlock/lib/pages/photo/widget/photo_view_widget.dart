import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    Key? key,
    required this.imageList,
    required this.tag,
    required this.index,
  }) : super(key: key);

  final List<String> imageList;
  final String tag;
  final int index;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: index);

    return PhotoViewGallery.builder(
      itemCount: imageList.length,
      pageController: _pageController,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(
            imageList[index],
          ),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          heroAttributes: PhotoViewHeroAttributes(tag: tag),
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
