import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//控件
class TestDemoPage extends StatefulWidget {
  String testName;
  StatelessWidget testWidget;

  TestDemoPage({Key key, @required this.testWidget, @required this.testName})
      : super(key: key);

  @override
  _TestDemoPageState createState() {
    return _TestDemoPageState();
  }
}

//状态
class _TestDemoPageState extends State<TestDemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: widget.testWidget,
    );
  }
}
