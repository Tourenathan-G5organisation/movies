import 'package:flutter/material.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/model/Movie.dart';
import 'widget/movie_detail_header.dart';
import 'widget/movie_detail_story.dart';
import 'widget/movie_detail_photo_scroller.dart';
import 'widget/movie_detail_actor_scroller.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/movie_state.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.movieID});

  final int movieID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      builder: (context) => MovieState(movieID),
      child: Consumer<MovieState>(builder: (context, movieState, _) {
        if (movieState.isLoading()) {
          return Container(child: Center(child: CircularProgressIndicator(),
          ));
        }
        return SingleChildScrollView(
            child: Column(
          children: <Widget>[
            MovieDetailHeader(movieState.movie),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Storyline(movieState.movie.storyline),
            ),
            PhotoScroller(movieState.movie.photoUrls),
            SizedBox(height: 20.0),
            //ActorScroller(movieState.movie.actors),
            //SizedBox(height: 20.0),
          ],
        ));
      }),
    ));
  }
}
