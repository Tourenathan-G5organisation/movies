import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/home_page_movies_content.dart';
import 'presentation/my_flutter_app_icons.dart';

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
      length: 4,
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
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: [
            MoviesContent(),
            MoviesContent(),
            MoviesContent(),
            Container(
              color: Colors.black,
            ),
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon( MyFlutterApp.film),
            ),
            Tab(
              icon: Icon(MyFlutterApp.television),
            ),
            Tab(
              icon: Icon(MyFlutterApp.videocam),
            ),
            Tab(
              icon: Icon(Icons.person_outline, size: 30,),
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


  List<Movie> _createFakeData() {
    List<Movie> movies = <Movie>[];
    for (int i = 0; i < 6; i++) {
      movies.add(Movie(
          bannerUrl: 'asset/images/banner.jpg',
          posterUrl: 'asset/images/poster.jpg',
          title: 'Le Blanc d\'Eyenga 2',
          rating: 8.0,
          starRating: 4,
          categories: ['Comedy', 'Drame'],
          storyline: 'For their fifth fully-animated feature-film '
              'collaboration, Illumination Entertainment and Universal '
              'Pictures present The Secret Life of Pets, a comedy about '
              'the lives our...',
          photoUrls: [
            'asset/images/image1.jpg',
            'asset/images/image2.jpg',
            'asset/images/image3.jpg',
            'asset/images/image4.jpg',
          ],
          actors: [
            Actor(
              name: 'Thierry Ntamack',
              avatarUrl: 'asset/images/tamack.jpg',
            ),
            Actor(
              name: 'Aicha Wète Kaprisky',
              avatarUrl: 'asset/images/aicha.jpg',
            ),
            Actor(
              name: 'Lucie Memba',
              avatarUrl: 'asset/images/lucie.jpg',
            ),
            Actor(
              name: 'Kaline Truong',
              avatarUrl: 'asset/images/kaline.jpg',
            ),
            Actor(
              name: 'Jeanne Mbenti',
              avatarUrl: 'asset/images/jeane.jpg',
            )
          ]));
    }
    return movies;
  }
}
