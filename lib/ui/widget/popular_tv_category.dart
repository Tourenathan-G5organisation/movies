import 'package:flutter/material.dart';
import 'package:movies/model/Tv.dart';
import 'package:movies/ui/widget/home_page_tv_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/states/popular_tv.dart';

class PopularTvCategory extends StatelessWidget {

  final String categoryTitle = 'Popular';
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final popularTv = Provider.of<PopularTv>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;
    _scrollController =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent ) {
        popularTv.getMoreMovies();
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
            child: Consumer<PopularTv>(
                builder: (context, popularTV, _) {
                  if(popularTV.tv.isEmpty ){
                    return  popularTV.isLoading()?
                    Center(child: CircularProgressIndicator()) : Center(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("No Item available. Check your internet connection", style: TextStyle(color: Colors.black),)));
                  }
                  return ListView.builder(
                  itemCount: popularTV.tv.length,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  itemBuilder: ((context, i) {
                    if(popularTV.isLoading() && popularTV.tv.length-1 == i){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return TvItem(
                        TV: popularTV.tv[i],
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
