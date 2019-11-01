import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:provider/provider.dart';
import 'package:movies/ui/widget/home_page_movies_content.dart';
import 'package:movies/ui/widget/home_page_tv_content.dart';
import 'presentation/my_flutter_app_icons.dart';
import 'package:movies/ui/widget/home_page_data_search.dart';
import 'package:movies/ui/widget/home_page_people_content.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/popular_people.dart';
import 'package:movies/states/top_rated_movies.dart';
import 'package:movies/states/popular_movies.dart';
import 'package:movies/states/now_playing_movies.dart';
import 'package:movies/states/top_rated_tv.dart';
import 'package:movies/states/popular_tv.dart';
import 'package:movies/states/on_the_air_tv.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                builder: (context) => TopRatedMovies(context)),
            ChangeNotifierProvider(
                builder: (context) => NowPlayingMovies(context)),
            ChangeNotifierProvider(
                builder: (context) => PopularMovies(context)),
            ChangeNotifierProvider(builder: (context) => TopRatedTv(context)),
            ChangeNotifierProvider(builder: (context) => PopularTv(context)),
            ChangeNotifierProvider(builder: (context) => OnTheAirTv(context)),
            ChangeNotifierProvider(builder: (context) => PopularPeople(context),),
          ],
          child: TabBarView(
            children: [
              MoviesContent(),
              TvContent(),
              PeopleContent(),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(MyFlutterApp.film),
            ),
            Tab(
              icon: Icon(MyFlutterApp.television),
            ),

            Tab(
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
            ),
          ],
          labelColor: Colors.red[800],
          unselectedLabelColor: Colors.grey[400],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2,
          isScrollable: false,
          //indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red[800],
        ),
      ),
    );
  }
}
