import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/model/Person.dart';
import 'package:movies/api/movie_api_service.dart';

class PopularPeople with ChangeNotifier {
  List<Person> _people; // List of TVs to display
  bool _isLoading = true; // determines if the we are loading movies or not
  BuildContext _context;
  int _page = 0;
  int _maxPage = 1;
  MovieApiService _movieApiService;

  PopularPeople(this._context) {
    _people = [];
    _movieApiService = MovieApiService();
    getMorePeople();
  }

  List<Person> get people => _people;

  set people(List<Person> newPeople) {
    _people.addAll(newPeople);
    notifyListeners();
  }

  void getMorePeople() async {
    if (_page < _maxPage) {
      _page++;
      _isLoading = true;
      notifyListeners();
      ApiResponse response = await _movieApiService.getPopularPeople(_page);
      print(response.toString());
      _isLoading = false;
      if (response.hasResponse) {
        _maxPage = response.results["total_pages"] ?? _maxPage;
        List<Person> loadedPeople = (response.results["results"] as List).map((item) => Person.fromJson(item)).toList();
        people = loadedPeople;
      } else {
        //if (movies.length == 0) {}
        notifyListeners();
      }
    }
  }

  bool isLoading() => _isLoading;

}
