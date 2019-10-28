import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/api/movie_api_service.dart';

class MovieState with ChangeNotifier {
  Movie _movie;
  bool _isLoading = true; // determines if the we are loading movies or not
  int _movieID;

  MovieApiService _movieApiService;

  MovieState(this._movieID) {
    _movieApiService = MovieApiService();
    getMovieDetails(_movieID);
  }

  Movie get movie => _movie;

  set movies(Movie newMovie) {
    _movie = newMovie;
    notifyListeners();
  }

  bool isLoading() => _isLoading;

  void getMovieDetails(int movieID) async{

      ApiResponse response = await _movieApiService.getMovieDetails(movieID);
      _isLoading = false;
      if (response.hasResponse) {
        movies = Movie.fromJson(response.results);

      } else {
        //if (movies.length == 0) {}
        notifyListeners();
      }
  }

}
