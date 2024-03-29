import 'package:movies/model/Actor.dart';

class Movie {
  Movie({
    this.id,
    this.bannerUrl,
    this.posterUrl,
    this.title,
    this.rating,
    this.starRating,
    this.categories,
    this.storyline,
    this.photoUrls,
    this.actors,
  });

  final int id;
  final String bannerUrl;
  final String posterUrl;
  final String title;
  final double rating;
  final double starRating;
  final List<String> categories;
  final String storyline;
  List<String> photoUrls;
  List<Actor> actors;

  Movie.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        rating = (data['vote_average'] != null)?data['vote_average'].toDouble(): 0,
        storyline = data['overview'],
        bannerUrl =  (data['backdrop_path'] != null)? "https://image.tmdb.org/t/p/w500/"+data['backdrop_path']: null,
        posterUrl =  (data['poster_path'] != null)?  "https://image.tmdb.org/t/p/w500/"+data['poster_path']: '',
        starRating = (data['vote_average'] != null)? (data['vote_average'].toDouble()/2) : 0,
        categories = (data['genres'] !=null)?(data['genres'] as List).map((item) => item["name"]).toList().cast<String>() : null,
        photoUrls = null,
        actors = null;
}
