import 'package:flutter/material.dart';
import 'movie_detail_arc_banner_image.dart';
import 'package:movies/model/Movie.dart';
import 'movie_detail_poster.dart';
import 'movie_detail_header_text.dart';

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
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          top: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(movie.posterUrl, height: 180.0),
              SizedBox(width: 16.0),
              Expanded(child: HeaderText(movie: movie,))
            ],
          ),
        )
      ],
    );
  }

}