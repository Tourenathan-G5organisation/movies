import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/ui/widget/home_page_movie_item.dart';

class PopularMovieCategory extends StatelessWidget {
  PopularMovieCategory({this.categoryTitle, this.movies});

  final String categoryTitle;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 8.0, left: 10.0),
              itemBuilder: ((context, i) {
                return MovieItem(
                  movie: movies[i],
                  height: 200.0,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

