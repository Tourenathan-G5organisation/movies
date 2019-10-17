import 'package:flutter/material.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/model/Movie.dart';
import 'widget/movie_detail_header.dart';
import 'widget/movie_detail_story.dart';
import 'widget/movie_detail_photo_scroller.dart';
import 'widget/movie_detail_actor_scroller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.movie});

  final Movie movie;

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
         SizedBox(height: 20.0),
          ActorScroller(movie.actors),
         SizedBox(height: 20.0),

        ],
      ),
    ));
  }

}
