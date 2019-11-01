import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/model/Tv.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/api/movie_api_service.dart';

class TvState with ChangeNotifier {
  Tv _tv;
  bool _isLoading = true; // determines if the we are loading movies or not
  int _tvID;

  MovieApiService _movieApiService;

  TvState(this._tvID) {
    _movieApiService = MovieApiService();
    getTvDetails(_tvID);
  }

  Tv get tv => _tv;

  set tv(Tv newTv) {
    _tv = newTv;
    notifyListeners();
  }

  bool isLoading() => _isLoading;

  void getTvDetails(int tvID) async{

      ApiResponse response = await _movieApiService.getTvDetails(tvID);
      _isLoading = false;
      if (response.hasResponse) {
        tv = Tv.fromJson(response.results);
        //getTvImages(movieID);
        //getMovieActors(movieID);
      } else {
        //if (movies.length == 0) {}
        notifyListeners();
      }
  }

  void getTvImages(int movieID) async{
    ApiResponse response = await _movieApiService.getMovieImages(movieID);
    if (response.hasResponse) {
      if(response.results['backdrops'] !=null){
       List<String> photoUrl =  (response.results['backdrops'] as List).map((item) => "https://image.tmdb.org/t/p/w500/"+item['file_path']).toList().cast<String>();
       tv.photoUrls = photoUrl;
       notifyListeners();
      }
    }
  }

  void getMovieActors(int movieID) async{
    ApiResponse response = await _movieApiService.getMovieActors(movieID);
    if (response.hasResponse) {
      if(response.results['cast'] != null){
        tv.actors =  (response.results['cast'] as List).map((item) => Actor(name: item['name'], avatarUrl: (item['profile_path']!=null)?"https://image.tmdb.org/t/p/w500/"+item['profile_path']:null)).toList();
        notifyListeners();
      }
    }
  }

}
