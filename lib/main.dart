import 'package:flutter/material.dart';
import 'ui/homepage.dart';
import 'ui/detailpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String title = "MOVIES";
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
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


