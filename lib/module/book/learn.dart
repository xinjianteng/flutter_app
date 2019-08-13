import 'package:flutter/material.dart';
import 'package:flutter_app/demo/ImageTest.dart';
import 'package:flutter_app/demo/formTest.dart';

class Learn extends StatefulWidget {
  Learn() : super();

  @override
  _LearnState createState() {
    // TODO: implement createState
    return _LearnState();
  }
}

class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      child: ImageTest(),
      child: FormTest(),
    );
  }
}
