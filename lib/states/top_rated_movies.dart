import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/api/movie_api_service.dart';

class TopRatedMovies with ChangeNotifier {
  List<Movie> _movies; // List of movies to display
  bool _isLoading = true; // determines if the we are loading movies or not
  BuildContext _context;
  int _page = 0;
  int _maxPage = 1;
  MovieApiService _movieApiService;

  TopRatedMovies(this._context) {
    _movies = [];
    _movieApiService = MovieApiService();
    getMoreMovies();
  }

  List<Movie> get movies => _movies;

  set movies(List<Movie> newMovies) {
    _movies.addAll(newMovies);
    notifyListeners();
  }

  void getMoreMovies() async {
    if (_page < _maxPage) {
      _page++;
      _isLoading = true;
      notifyListeners();
      ApiResponse response = await _movieApiService.getTopRatedMovies(_page);
      print(response.toString());
      _isLoading = false;
      if (response.hasResponse) {
        _maxPage = response.results["total_pages"] ?? _maxPage;
        List<Movie> loadedMovies = (response.results["results"] as List).map((item) => Movie.fromJson(item)).toList();
        movies = loadedMovies;
      } else {
        //if (movies.length == 0) {}
        notifyListeners();
      }
    }
  }

  bool isLoading() => _isLoading;

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
          storyline:
              'Le Blanc d\'Eyenga est un film du réalisateur et acteur camerounais, '
              'Thierry ntamack, qui décrit comment une dame camerounaise veut '
              'désespérément un homme blanc pour de l\'argent et montre '
              'comment elle utilise cet argent pour financer le voyage de son...',
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
