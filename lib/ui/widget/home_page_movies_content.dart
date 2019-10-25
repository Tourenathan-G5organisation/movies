import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/now_playing_movie_category.dart';
import 'package:movies/ui/widget/popular_movie_category.dart';
import 'package:movies/ui/widget/top_rated_movie_category.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/top_rated_movies.dart';
import 'package:movies/states/popular_movies.dart';
import 'package:movies/states/now_playing_movies.dart';

class MoviesContent extends StatelessWidget {
  MoviesContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        // alignment: Alignment.center,
        child: MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => TopRatedMovies(context)),
          ChangeNotifierProvider(builder: (context) => NowPlayingMovies(context)),
          ChangeNotifierProvider(builder: (context) => PopularMovies(context)),
    ],
    child:
        Column(
          children: [
            TopRatedMovieCategory(
              categoryTitle: "Top rated",
            ),
            SizedBox(
              height: 10.0,
            ),
            NowPlayingMovieCategory(
              categoryTitle: "Now playing",
            ),
            SizedBox(
              height: 10.0,
            ),
            PopularMovieCategory(
              categoryTitle: "Popular",
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),),
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
