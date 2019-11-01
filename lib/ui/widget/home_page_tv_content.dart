import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/on_the_air_tv_category.dart';
import 'package:movies/ui/widget/popular_tv_category.dart';
import 'package:movies/ui/widget/top_rated_tv_category.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/top_rated_tv.dart';
import 'package:movies/states/popular_tv.dart';
import 'package:movies/states/on_the_air_tv.dart';

class TvContent extends StatelessWidget {
  TvContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        // alignment: Alignment.center,
        child: Column(
          children: [
            PopularTvCategory(),
            SizedBox(
              height: 10.0,
            ),
            TopRatedTvCategory(),
            SizedBox(
              height: 10.0,
            ),
            OnTheAirTvCategory(),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),//),
      ),
    );
  }
}
