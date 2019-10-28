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
  final int starRating;
  final List<String> categories;
  final String storyline;
  final List<String> photoUrls;
  final List<Actor> actors;

  Movie.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        rating = data['vote_average'].toDouble(),
        storyline = data['"overview'],
        bannerUrl = data['backdrop_path'],
        posterUrl = /*'asset/images/poster.jpg',*/ data['poster_path'],
        starRating = 0,
        categories = null,
        photoUrls = null,
        actors = null;
}
