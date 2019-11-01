import 'package:flutter/material.dart';
import 'movie_detail_arc_banner_image.dart';
import 'package:movies/model/Tv.dart';
import 'movie_detail_poster.dart';
import 'movie_detail_header_text.dart';

class TvDetailHeader extends StatelessWidget{

  TvDetailHeader(this.tv);

  final Tv tv;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Padding(
          child: ArcBannerImage(tv.bannerUrl),
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
              Poster(tv.posterUrl, height: 180.0),
              SizedBox(width: 16.0),
              Expanded(child: HeaderText(title: tv.title, rating: tv.rating, starRating: tv.starRating, categories: tv.categories,))
            ],
          ),
        )
      ],
    );
  }

}