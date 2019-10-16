import 'package:flutter/material.dart';
import 'ui/homepage.dart';
import 'ui/detailpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String title = "MOVIE";
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        accentColor: Colors.red[600],
      ),
      home: HomePage(title: title),
      //home: DetailPage(),
    );
  }
}


