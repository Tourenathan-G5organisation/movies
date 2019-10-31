import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/model/Tv.dart';
import 'package:movies/api/movie_api_service.dart';

class OnTheAirTv with ChangeNotifier {
  List<Tv> _tv; // List of TVs to display
  bool _isLoading = true; // determines if the we are loading movies or not
  BuildContext _context;
  int _page = 0;
  int _maxPage = 1;
  MovieApiService _movieApiService;

  OnTheAirTv(this._context) {
    _tv = [];
    _movieApiService = MovieApiService();
    getMoreMovies();
  }

  List<Tv> get tv => _tv;

  set tv(List<Tv> newTv) {
    _tv.addAll(newTv);
    notifyListeners();
  }

  void getMoreMovies() async {
    if (_page < _maxPage) {
      _page++;
      _isLoading = true;
      notifyListeners();
      ApiResponse response = await _movieApiService.getOnTheAirTV(_page);
      print(response.toString());
      _isLoading = false;
      if (response.hasResponse) {
        _maxPage = response.results["total_pages"] ?? _maxPage;
        List<Tv> loadedMovies = (response.results["results"] as List).map((item) => Tv.fromJson(item)).toList();
        tv = loadedMovies;
      } else {
        //if (movies.length == 0) {}
        notifyListeners();
      }
    }
  }

  bool isLoading() => _isLoading;

}
