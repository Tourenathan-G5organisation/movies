import 'package:flutter/material.dart';
import 'package:movies/model/Tv.dart';
import 'package:movies/ui/widget/home_page_tv_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/on_the_air_tv.dart';

class OnTheAirTvCategory extends StatelessWidget {

  final String categoryTitle = 'On The Air';
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final ontheairTv = Provider.of<OnTheAirTv>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;
    _scrollController =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent ) {
        ontheairTv.getMoreMovies();
      }
    });

    return Material(
      color: Colors.white,
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              categoryTitle,
              style: textTheme.subhead.copyWith(fontSize: 18.0),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(260.0),
            child: Consumer<OnTheAirTv>(
                builder: (context, ontheairTV, _) {
                  if(ontheairTV.tv.isEmpty ){
                    return  ontheairTV.isLoading()?
                    Center(child: CircularProgressIndicator()) : Center(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("No Item available. Check your internet connection", style: TextStyle(color: Colors.black),)));
                  }
                  return ListView.builder(
                  itemCount: ontheairTV.tv.length,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  itemBuilder: ((context, i) {
                    if(ontheairTV.isLoading() && ontheairTV.tv.length-1 == i){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return TvItem(
                        TV: ontheairTV.tv[i],
                        height: 200.0,
                      );
                    }
                  }),
                );})
            ),

        ],
      ),
    );
  }
}
