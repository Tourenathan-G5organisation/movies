import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  Rating({this.rating, this.starRating});

  final double rating;
  final double starRating;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

      return FlutterRatingBar(
      itemCount: 5,
      initialRating: starRating,
      fillColor: theme.accentColor,
      borderColor: Colors.black26,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 24,

    );
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
            color: theme.accentColor,
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
        _buildRatingBar(theme),
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
