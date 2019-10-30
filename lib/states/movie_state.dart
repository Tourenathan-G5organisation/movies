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

  set movie(Movie newMovie) {
    _movie = newMovie;
    notifyListeners();
  }

  bool isLoading() => _isLoading;

  void getMovieDetails(int movieID) async{

      ApiResponse response = await _movieApiService.getMovieDetails(movieID);
      _isLoading = false;
      if (response.hasResponse) {
        movie = Movie.fromJson(response.results);
        getMovieImages(movieID);
      } else {
        //if (movies.length == 0) {}
        notifyListeners();
      }
  }

  void getMovieImages(int movieID) async{
    ApiResponse response = await _movieApiService.getMovieImages(movieID);
    if (response.hasResponse) {
      if(response.results['backdrops'] !=null){
       List<String> photoUrl =  (response.results['backdrops'] as List).map((item) => "https://image.tmdb.org/t/p/w500/"+item['file_path']).toList().cast<String>();
       movie.photoUrls = photoUrl;
       notifyListeners();
      }
    }
  }

}
