import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/ui/widget/home_page_movie_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/now_playing_movies.dart';

class NowPlayingMovieCategory extends StatelessWidget {
  NowPlayingMovieCategory({this.categoryTitle});

  final String categoryTitle;
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final nowPlayingMovies =
        Provider.of<NowPlayingMovies>(context, listen: false);
    _scrollController =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        nowPlayingMovies.getMoreMovies();
      }
    });

    return Material(
      color: Colors.white,
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              categoryTitle,
              style: textTheme.subhead.copyWith(fontSize: 18.0),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(260.0),
            child: Consumer<NowPlayingMovies>(
              builder: (context, nowPlayingMovies, _) => ListView.builder(
                    itemCount: nowPlayingMovies.movies.length,
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                    itemBuilder: ((context, i) {
                      return MovieItem(
                        movie: nowPlayingMovies.movies[i],
                        height: 200.0,
                      );
                    }),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
