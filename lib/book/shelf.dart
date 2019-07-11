import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//控件
class Shelf extends StatefulWidget {
  final String mt;

  Shelf({Key key, @required this.mt}) : super(key: key);

  @override
  _ShelfState createState() {
    return _ShelfState();
  }
}

//状态
class _ShelfState extends State<Shelf> {
  @override
  Widget build(BuildContext context) => Text(widget.mt);
}
