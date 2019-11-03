import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/search_movies.dart';
import 'package:movies/ui/widget/home_page_movie_item.dart';


class DataSearch extends SearchDelegate<String> {
  ScrollController _scrollController;

  @override
  String get searchFieldLabel => 'Search Movie';

  final movies = [
    "Hunter games",
    "the king of boys",
    "Ma patrie dabor",
    "the wedding",
    "ma famille",
    "Fifty shades"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filtered =
    movies.where((item) => item.startsWith(query)).toList();
    return Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: ListView(
          children: filtered
              .map<Widget>(
                (title) =>
                ListTile(
                  title: RichText(
                    text: TextSpan(
                        text: title.substring(0, query.length),
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: title.substring(query.length),
                              style: TextStyle(color: Colors.grey))
                        ]),
                  ),
                ) /*Text(title, style: TextStyle(fontSize: 16.0),)*/,
          )
              .toList(),
        ));
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ChangeNotifierProvider(builder: (context) => SearchMovies(),
        child: Consumer<SearchMovies>(builder: (context, searchState, _) {
      _scrollController =
          ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
      _scrollController.addListener(() {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          searchState.getMoreMovies(query);
        }
      });
      if (query.length < 2) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Search string must be atleast two letters.",
              ),
            )
          ],
        );
      }

      if (searchState.isLoading() && searchState.movies.length == 0) {
        searchState.initSearch(query);
        return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ));
      }
      if (searchState.movies.length == 0) {
        return Container(
            child: Center(
              child: Text("No item found", style: TextStyle(fontSize: 17.0),),
            ),);
      }
      return OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          childAspectRatio: 0.6,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 0.0,
          controller: _scrollController,
          children: List.generate(searchState.movies.length, (index) {
            if (searchState.isLoading() &&
                searchState.movies.length - 1 == index) {
              return Center(child: CircularProgressIndicator());
            } else {
              return MovieItem(
                movie: searchState.movies[index], height: 250,
              );
            }
          }),
        );
      });

      /*return Container(
        child: Center(
          child: Text("Search result will appear here"),
        ),
      );*/
    }));
  }
}
