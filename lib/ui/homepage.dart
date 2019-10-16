import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/movie_category.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          // alignment: Alignment.center,
          child: Column(
            children: [
              MovieCategory(
                categoryTitle: "Popular",
                movies: _createFakeData(),
              ),
              SizedBox(height: 10.0,),
              MovieCategory(
                categoryTitle: "Top100",
                movies: _createFakeData(),
              ),
              SizedBox(height: 10.0,),
            ],

          ),
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
