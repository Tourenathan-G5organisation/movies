import 'package:flutter/material.dart';
import 'movie_detail_arc_banner_image.dart';
import 'package:movies/model/Movie.dart';

class MovieDetailHeader extends StatelessWidget{

  MovieDetailHeader(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Padding(
          child: ArcBannerImage(movie.bannerUrl),
          padding: const EdgeInsets.only(bottom: 140.0),
        ),
      ],
    );
  }

}