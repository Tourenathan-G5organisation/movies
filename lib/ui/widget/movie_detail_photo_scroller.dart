import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/ui/photo_galery.dart';

class PhotoScroller extends StatelessWidget {
  PhotoScroller(this.photoUrls);

  final List<String> photoUrls;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    if (photoUrls != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Photos',
              style: textTheme.subhead.copyWith(fontSize: 18.0),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(100.0),
            child: ListView.builder(
                itemBuilder: _buildPhoto,
                itemCount: photoUrls.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 8.0, left: 20.0)),
          ),
        ],
      );
    }
    return Container(
      width: 0.0,
      height: 0.0,
    );
  }

  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: CachedNetworkImage(
            imageUrl: photo,
            width: 177.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () => open(context, index),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoGallery(
            usePageViewWrapper: false,
            galleryItems: photoUrls,
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            initialIndex: index,
          ),
        ));
  }
}
