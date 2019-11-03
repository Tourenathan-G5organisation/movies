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
              ActorScroller(movieState.movie.actors, 'Actors'),
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
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 18.0, bottom: 18),
                      child: Column(children: [
                        Row(children: [
                          Text('Number of seassons:  ', style: TextStyle(fontSize: 16.0),),
                          Text(tvState.tv.seasonCount.toString(),
                            style: Theme.of(context).textTheme.body1.copyWith(
                              //color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),),
                        ],
                      ),
                        SizedBox(height: 10.0),

                        Row(children: [
                          Text('Number of episodes:  ', style: TextStyle(fontSize: 16.0),),
                          Text(tvState.tv.episodeCount.toString(),
                            style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),),
                        ],
                        ),
                        (tvState.tv.firstAirDate != null)?
                        Padding(child: Row(children: [
                          Text('First air date:  ', style: TextStyle(fontSize: 16.0),),
                          Text(tvState.tv.firstAirDate,
                            style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),),
                        ],
                        ),
                        padding: EdgeInsets.only(top: 10.0)):Container(width: 0.0, height: 0.0,),
                      ],),
                    ),
                    PhotoScroller(tvState.tv.photoUrls),
                    SizedBox(height: 20.0),
                    ActorScroller(tvState.tv.createdBy, "Created by"),
                    SizedBox(height: 20.0),
                    ActorScroller(tvState.tv.actors, "Actors"),
                    SizedBox(height: 20.0),

                    ]));
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
