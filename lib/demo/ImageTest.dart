import 'package:flutter/material.dart';

class ImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(

      scrollDirection: Axis.vertical,
      children: <Widget>[
        ContainerDemo(
          child: Column(
            children: <Widget>[
              Text('加载网络图片 \n'
                  '宽高120 \n'
                  'fix:BoxFix.fill '),
              Image(
                image: NetworkImage(
                  'http://p0.so.qhimgs1.com/bdr/326__/t01c44703a9e96eac6a.jpg',
                ),
                width: 120.0,
                height: 120.0,
                fit: BoxFit.fill,
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
        ContainerDemo(
          child: Column(
            children: <Widget>[
              Text('加载网络图片 \n'
                  '宽高120 \n'
                  'fix:BoxFix.contain '),
              Image(
                image: NetworkImage(
                  'http://p0.so.qhimgs1.com/bdr/326__/t01c44703a9e96eac6a.jpg',
                ),
                width: 120.0,
                height: 120.0,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: child,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.blue[200],
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
