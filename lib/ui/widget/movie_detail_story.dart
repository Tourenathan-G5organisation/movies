import 'package:flutter/material.dart';

class Storyline extends StatelessWidget {
  Storyline(this.storyline);

  final String storyline;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    if(storyline != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Story line',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          Text(
            storyline,
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 17.0,
            ),
          ),
        ],
      );
    }
    return Container(width: 0.0, height: 0.0,);
  }
}
