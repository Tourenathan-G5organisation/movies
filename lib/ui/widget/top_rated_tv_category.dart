import 'package:flutter/material.dart';
import 'package:movies/model/Tv.dart';
import 'package:movies/ui/widget/home_page_tv_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/top_rated_tv.dart';

class TopRatedTvCategory extends StatelessWidget {

  final String categoryTitle = 'Top Rated';
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final topRatedTv = Provider.of<TopRatedTv>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;
    _scrollController =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent ) {
        topRatedTv.getMoreMovies();
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
            child: Consumer<TopRatedTv>(
                builder: (context, topRatedTV, _) {
                  if(topRatedTV.tv.isEmpty ){
                    return  topRatedTV.isLoading()?
                    Center(child: CircularProgressIndicator()) : Center(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("No Item available. Check your internet connection", style: TextStyle(color: Colors.black),)));
                  }
                  return ListView.builder(
                  itemCount: topRatedTV.tv.length,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  itemBuilder: ((context, i) {
                    if(topRatedTV.isLoading() && topRatedTV.tv.length-1 == i){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return TvItem(
                        TV: topRatedTV.tv[i],
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
