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
        child: /*MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => TopRatedMovies(context)),
          ChangeNotifierProvider(builder: (context) => NowPlayingMovies(context)),
          ChangeNotifierProvider(builder: (context) => PopularMovies(context)),
    ],
    child:*/
        Column(
          children: [
            PopularMovieCategory(
              categoryTitle: "Popular",
            ),
            SizedBox(
              height: 10.0,
            ),
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
          ],
        ),//),
      ),
    );
  }
}
