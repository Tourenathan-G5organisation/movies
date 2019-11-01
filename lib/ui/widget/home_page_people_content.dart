import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/on_the_air_tv_category.dart';
import 'package:movies/ui/widget/popular_tv_category.dart';
import 'package:movies/ui/widget/top_rated_tv_category.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/top_rated_tv.dart';
import 'package:movies/states/popular_people.dart';
import 'package:movies/ui/widget/home_page_people_item.dart';

class PeopleContent extends StatelessWidget {
  PeopleContent({Key key}) : super(key: key);
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final popularPeople = Provider.of<PopularPeople>(context, listen: false);
    _scrollController =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        popularPeople.getMorePeople();
      }
    });
    return Container(
      color: Colors.grey[100],
      alignment: Alignment.center,
      child: Consumer<PopularPeople>(builder: (context, people, _) {
        if(people.people.isEmpty ){
          return  people.isLoading()?
          Center(child: CircularProgressIndicator()) : Center(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("No Item available. Check your internet connection", style: TextStyle(color: Colors.black),)));
        }
        return OrientationBuilder(builder: (context, orientation){
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: orientation == Orientation.portrait? 2 : 3,
            childAspectRatio: 0.564,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 0.0,
            controller: _scrollController,
            children: List.generate(people.people.length, (index) {
              if(people.isLoading() && people.people.length-1 == index){
                return Center(child: CircularProgressIndicator());
              }else {
                return PeopleItem(
                  person: people.people[index],
                );
              }
            }),
          );
        });
      }),
    );
  }
}
