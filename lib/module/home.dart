import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('test'),
      ),
      body: Center(
        child: Text(
          'home',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
