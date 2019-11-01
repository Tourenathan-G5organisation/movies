import 'package:flutter/material.dart';
import 'widget/movie_detail_header.dart';
import 'widget/tv_detail_header.dart';
import 'widget/movie_detail_story.dart';
import 'widget/movie_detail_photo_scroller.dart';
import 'widget/movie_detail_actor_scroller.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/movie_state.dart';
import 'package:movies/states/tv_state.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.itemId, this.type});

  final int itemId;
  final int type;

  @override
  Widget build(BuildContext context) {
    if (type == 1) {
      return Scaffold(
          body: ChangeNotifierProvider(
        builder: (context) => MovieState(itemId),
        child: Consumer<MovieState>(builder: (context, movieState, _) {
          if (movieState.isLoading()) {
            return Container(
                child: Center(
              child: CircularProgressIndicator(),
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
              ActorScroller(movieState.movie.actors),
              SizedBox(height: 20.0),
            ],
          ));
        }),
      ));
    } else if (type == 2) {
      return Scaffold(
          body: ChangeNotifierProvider(
              builder: (context) => TvState(itemId),
              child: Consumer<TvState>(builder: (context, tvState, _) {
                if (tvState.isLoading()) {
                  return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
                }
                return SingleChildScrollView(
                    child: Column(
                    children: <Widget>[
                    TvDetailHeader(tvState.tv),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Storyline(tvState.tv.storyline),
                    ),]));
              })));
    } else if (type == 3) {
    } else
      return Container(
        child: Center(
          child: Text("Unknown item"),
        ),
      );
  }
}
