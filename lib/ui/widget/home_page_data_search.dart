import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final movies = [
    "Hunter games",
    "eyenga 1",
    "Ma patrie dabor",
    "Le blanc d'eyenga",
    "ma famille",
    "flutter movie",
    "Fifty shades"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filtered =
        movies.where((item) => item.startsWith(query)).toList();
    return Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: ListView(
          children: filtered
              .map<Widget>(
                (title) => ListTile(
                      title: RichText(
                        text: TextSpan(
                            text: title.substring(0, query.length),
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: title.substring(query.length),
                                  style: TextStyle(color: Colors.grey))
                            ]),
                      ),
                    ) /*Text(title, style: TextStyle(fontSize: 16.0),)*/,
              )
              .toList(),
        ));
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    return Container(
      child: Center(
        child: Text("Search result will appear here"),
      ),
    );
  }
}
