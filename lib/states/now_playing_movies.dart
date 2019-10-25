import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';

class NowPlayingMovies with ChangeNotifier {
  List<Movie> _movies;

  NowPlayingMovies(BuildContext context) {
    _movies = [];
  }

  List<Movie> get movies => _movies;

  set movies(List<Movie> newMovies) {
    _movies.addAll(newMovies);
    notifyListeners();
  }
}
