import 'package:flutter/material.dart';
import 'package:movies/model/Person.dart';
import 'package:movies/ui/detailpage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PeopleItem extends StatelessWidget {
  PeopleItem({Key key, this.person, this.height}) : super(key: key);
  final Person person;
  final double height;
  static const POSTER_RATIO = 0.7;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = POSTER_RATIO * height;
    return GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                imageUrl: (person.url != null)
                    ? "https://image.tmdb.org/t/p/w500/" + person.url
                    : '',
               /* width: width,
                height: height,*/
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              child: Center(child: Padding(
                child: RichText(
                  text: TextSpan(
                    text: person.name,
                    style: TextStyle(color: Colors.black),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                padding: EdgeInsets.only( top: 2.0),
              ),),
              //width: width,
            ),
          ],
        ),
        onTap: () {});
  }
}
