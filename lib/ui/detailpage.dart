import 'package:flutter/material.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/model/Movie.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: Center(
        child: Text("Movie details goes here"),
      ),
    );
  }

  Movie _createFakeData() {
    return Movie(
        bannerUrl: 'images/banner.png',
        posterUrl: 'images/poster.png',
        title: 'Le Blanc d\'Eyenga 2',
        rating: 8.0,
        starRating: 4,
        categories: ['Comedy', 'Drame'],
        storyline: 'For their fifth fully-animated feature-film '
            'collaboration, Illumination Entertainment and Universal '
            'Pictures present The Secret Life of Pets, a comedy about '
            'the lives our...',
        photoUrls: [
          'images/image1.jpg',
          'images/image2.jpg',
          'images/image3.jpg',
          'images/image4.jpg',
        ],
        actors: [
          Actor(
            name: 'Thierry Ntamack',
            avatarUrl: 'images/tamack.jpg',
          ),
          Actor(
            name: 'Aicha Wète Kaprisky',
            avatarUrl: 'images/aicha.jpg',
          ),
          Actor(
            name: 'Lucie Memba',
            avatarUrl: 'images/lucie.jpg',
          ),
          Actor(
            name: 'Kaline Truong',
            avatarUrl: 'images/kaline.jpg',
          ),
          Actor(
            name: 'Jeanne Mbenti',
            avatarUrl: 'images/jeane.jpg',
          )
        ]);
  }
}
