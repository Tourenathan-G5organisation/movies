import 'package:flutter/material.dart';
import 'package:movies/model/Movie.dart';
import 'package:movies/model/Actor.dart';
import 'package:movies/ui/widget/home_page_movies_content.dart';
import 'presentation/my_flutter_app_icons.dart';
import 'package:movies/ui/widget/home_page_data_search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            MoviesContent(),
            Container(child: Center(child: Text('TV programs will appear here', style: Theme.of(context).textTheme.display1.copyWith(fontSize: 20.0),),),),
            MoviesContent(),
            Container(
              child: Center(child: Text('Popular actors will appear here', style: Theme.of(context).textTheme.display1.copyWith(fontSize: 20.0, color: Colors.white),),),
              color: Colors.black,
            ),
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon( MyFlutterApp.film),
            ),
            Tab(
              icon: Icon(MyFlutterApp.television),
            ),
            Tab(
              icon: Icon(MyFlutterApp.videocam),
            ),
            Tab(
              icon: Icon(Icons.person_outline, size: 30,),
            ),
          ],
          labelColor: Colors.red[800],
          unselectedLabelColor: Colors.grey[400],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2,
          isScrollable: false,
          //indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red[800],
        ),
      ),
    );
  }

}
