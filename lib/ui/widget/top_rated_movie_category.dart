import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/ui/widget/home_page_movie_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/top_rated_movies.dart';

class TopRatedMovieCategory extends StatelessWidget {
  TopRatedMovieCategory({this.categoryTitle});

  final String categoryTitle;
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final topRatedMovies = Provider.of<TopRatedMovies>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;
    _scrollController =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent ) {
        topRatedMovies.getMoreMovies();
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
            child: Consumer<TopRatedMovies>(
                builder: (context, topRatedMovies, _) {
                  if(topRatedMovies.movies.isEmpty ){
                    return  topRatedMovies.isLoading()?
                    Center(child: CircularProgressIndicator()) : Center(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("No Item available. Check your internet connection", style: TextStyle(color: Colors.black),)));
                  }
                  return ListView.builder(
                  itemCount: topRatedMovies.movies.length,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  itemBuilder: ((context, i) {
                    if(topRatedMovies.isLoading() && topRatedMovies.movies.length-1 == i){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return MovieItem(
                        movie: topRatedMovies.movies[i],
                        height: 200.0,
                      );
                    }
                  }),
                );})
            ),

        ],
      ),
    );
  }
}
