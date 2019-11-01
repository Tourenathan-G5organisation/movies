import 'package:flutter/material.dart';
import 'package:movies/model/Actor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActorScroller extends StatelessWidget {

  ActorScroller(this.actors, this.title);
  final List<Actor> actors;
  final String title;

  Widget _buildActor(BuildContext ctx, int index) {
    var actor = actors[index];
    if(actor.avatarUrl != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(actor.avatarUrl),
              radius: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(actor.name),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(ctx).accentColor,
            radius: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(actor.name),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    if(actors != null && !actors.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: textTheme.subhead.copyWith(fontSize: 18.0),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(120.0),
            child: ListView.builder(
              itemCount: actors.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 12.0, left: 20.0),
              itemBuilder: _buildActor,
            ),
          ),
        ],
      );
    }
    return Container(width: 0.0, height: 0.0,);
  }
}
