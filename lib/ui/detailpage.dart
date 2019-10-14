import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  DetailPage({Key key}) : super(key: key);


  @override
  _DetailPageState createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: Center(
        child: Text("Movie details goes here"),
      ),
    );
  }

}