import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(
    this.posterUrl, {
    this.height = 100.0,
  });

  final String posterUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(4.0),
      child: CachedNetworkImage(
        imageUrl: (posterUrl != null)? "https://image.tmdb.org/t/p/w500/$posterUrl": '',
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
