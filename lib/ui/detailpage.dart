import 'package:flutter/material.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/model/Movie.dart';
import 'widget/movie_detail_header.dart';
import 'widget/movie_detail_story.dart';
import 'widget/movie_detail_photo_scroller.dart';

class DetailPage extends StatelessWidget {
  DetailPage() {
    movie = _createFakeData();
  }

  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
         MovieDetailHeader(movie),
          Padding(padding: EdgeInsets.all(20.0),
          child: Storyline(movie.storyline),),
          PhotoScroller(movie.photoUrls),

        ],
      ),
    ));
  }

  Movie _createFakeData() {
    return Movie(
        bannerUrl: 'asset/images/banner.jpg',
        posterUrl: 'asset/images/poster.jpg',
        title: 'Le Blanc d\'Eyenga 2',
        rating: 8.0,
        starRating: 4,
        categories: ['Comedy', 'Drame'],
        storyline: 'For their fifth fully-animated feature-film '
            'collaboration, Illumination Entertainment and Universal '
            'Pictures present The Secret Life of Pets, a comedy about '
            'the lives our...',
        photoUrls: [
          'asset/images/image1.jpg',
          'asset/images/image2.jpg',
          'asset/images/image3.jpg',
          'asset/images/image4.jpg',
        ],
        actors: [
          Actor(
            name: 'Thierry Ntamack',
            avatarUrl: 'images/tamack.jpg',
          ),
          Actor(
            name: 'Aicha Wète Kaprisky',
            avatarUrl: 'images/aicha.jpg',
          ),
          Actor(
            name: 'Lucie Memba',
            avatarUrl: 'images/lucie.jpg',
          ),
          Actor(
            name: 'Kaline Truong',
            avatarUrl: 'images/kaline.jpg',
          ),
          Actor(
            name: 'Jeanne Mbenti',
            avatarUrl: 'images/jeane.jpg',
          )
        ]);
  }
}
