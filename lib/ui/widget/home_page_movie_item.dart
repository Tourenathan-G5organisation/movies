import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/ui/detailpage.dart';

class MovieItem extends StatelessWidget {
  MovieItem({Key key, this.movie, this.height}) : super(key: key);
  final Movie movie;
  final double height;
  static const POSTER_RATIO = 0.7;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = POSTER_RATIO * height;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                movie.posterUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              child: Text(movie.title),
              padding: EdgeInsets.only(left: 2.0, top: 5.0),
            ),
            Padding(
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Rating:",
                    style: theme.textTheme.body1.copyWith(
                      color: Colors.black45,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    movie.rating.toString(),
                    style: theme.textTheme.body1.copyWith(
                      color: theme.accentColor,
                      fontSize: 14.0,
                    ),
                  )
                ]),
                padding: EdgeInsets.only(left: 2.0, top: 2.0)),
          ],
        ),
      ),
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movie: movie,)));},);
  }
}