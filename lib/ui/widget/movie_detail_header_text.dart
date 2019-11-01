import 'package:flutter/material.dart';
import 'movie_detail_rating.dart';

class HeaderText extends StatelessWidget {
  HeaderText({this.title, this.rating, this.starRating, this.categories});

  final String title;
  final double rating;
  final double starRating;
  final List<String> categories;

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return categories.map((category) {
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
          title,
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 8.0),
        Rating(
          rating: rating,
          starRating: starRating,
        ),
        SizedBox(height: 12.0),
        Container(height: 35.0, child: ListView(children: _buildCategoryChips(Theme.of(context).textTheme, ), shrinkWrap: true, scrollDirection: Axis.horizontal,),),
        //),
      ],
    );
  }
}
