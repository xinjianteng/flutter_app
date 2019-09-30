import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/demo/testDemoPage.dart';
import 'package:flutter_app/res/strings.dart';

import 'ImageTest.dart';
import 'containerTest.dart';
import 'floatingActionButton.dart';

//控件
class TestPage extends StatefulWidget {
  static const String ROUTER_NAME = "/TestPage";

  @override
  _TestPageState createState() => _TestPageState();
}

//状态
class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            testName: res.testContainer,
            testWidget: ContainerTest(),
          ),
          ListViewItem(
            testName: res.testImage,
            testWidget: ImageTest(),
          )
        ],
      ),
    );
  }
}

class ListViewItem extends StatefulWidget {
  final String testName;
  final StatelessWidget testWidget;

  const ListViewItem({Key key, this.testName, this.testWidget})
      : super(key: key);

  @override
  _ListViewItemState createState() {
    // TODO: implement createState
    return _ListViewItemState();
  }
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text(widget.testName),
      onPressed: () {
        //导航到新路由
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return TestDemoPage(
            testWidget: widget.testWidget,
            testName: widget.testName,
          );
        }));
      },
    );
  }
}
