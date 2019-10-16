import 'package:flutter/material.dart';

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
      child: Image.asset(
        posterUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
