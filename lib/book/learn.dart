import 'package:flutter/material.dart';

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
    return Hello();
  }
}


class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.cyan
        ),
      ),
    );
  }

}
