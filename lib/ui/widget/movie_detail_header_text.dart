import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'movie_detail_rating.dart';

class HeaderText extends StatelessWidget {
  HeaderText({this.movie});

  final Movie movie;

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.categories.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          movie.title,
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 8.0),
        Rating(
          rating: movie.rating,
          starRating: movie.starRating,
        ),
        SizedBox(height: 12.0),
        Row( children: _buildCategoryChips(Theme.of(context).textTheme),
        ),
      ],
    );
  }
}
