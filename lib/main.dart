import 'package:flutter/material.dart';
import 'ui/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String title = "Movies";
    return MaterialApp(
      title: title,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFF5959),
      ),
      home: HomePage(title: title),
    );
  }
}


