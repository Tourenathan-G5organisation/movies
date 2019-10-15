import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  Rating({this.rating, this.starRating});

  final double rating;
  final int starRating;

  Widget _buildRatingBar() {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color = i <= starRating ? const Color(0xFFFF5959) : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var ratingCaptionStyle = theme.textTheme.caption.copyWith(color: Colors.black45);

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rating.toString(),
          style: theme.textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFF5959),
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            'Grade now',
            style: ratingCaptionStyle,
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        numericRating,
        SizedBox(width: 16.0),
        starRating,
      ],
    );
  }
}
