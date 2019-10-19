import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/movie_category.dart';

class MoviesContent extends StatelessWidget {
  MoviesContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        // alignment: Alignment.center,
        child: Column(
          children: [
            MovieCategory(
              categoryTitle: "Top rated",
              movies: _createFakeData(),
            ),
            SizedBox(
              height: 10.0,
            ),
            MovieCategory(
              categoryTitle: "Now playing",
              movies: _createFakeData(),
            ),
            SizedBox(
              height: 10.0,
            ),
            MovieCategory(
              categoryTitle: "Popular",
              movies: _createFakeData(),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  List<Movie> _createFakeData() {
    List<Movie> movies = <Movie>[];
    for (int i = 0; i < 6; i++) {
      movies.add(Movie(
          bannerUrl: 'asset/images/banner.jpg',
          posterUrl: 'asset/images/poster.jpg',
          title: 'Le Blanc d\'Eyenga 2',
          rating: 8.0,
          starRating: 4,
          categories: ['Comedy', 'Drame'],
          storyline: 'Le Blanc d\'Eyenga est un film du réalisateur et acteur camerounais, '
              'Thierry ntamack, qui décrit comment une dame camerounaise veut '
              'désespérément un homme blanc pour de l\'argent et montre '
              'comment elle utilise cet argent pour financer le voyage de son...',
          photoUrls: [
            'asset/images/image1.jpg',
            'asset/images/image2.jpg',
            'asset/images/image3.jpg',
            'asset/images/image4.jpg',
          ],
          actors: [
            Actor(
              name: 'Thierry Ntamack',
              avatarUrl: 'asset/images/tamack.jpg',
            ),
            Actor(
              name: 'Aicha Wète Kaprisky',
              avatarUrl: 'asset/images/aicha.jpg',
            ),
            Actor(
              name: 'Lucie Memba',
              avatarUrl: 'asset/images/lucie.jpg',
            ),
            Actor(
              name: 'Kaline Truong',
              avatarUrl: 'asset/images/kaline.jpg',
            ),
            Actor(
              name: 'Jeanne Mbenti',
              avatarUrl: 'asset/images/jeane.jpg',
            )
          ]));
    }
    return movies;
  }
}
