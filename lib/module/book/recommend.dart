import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/values/dimens.dart';

import 'detail.dart';

Dio dio = new Dio();

//控件
class Recommend extends StatefulWidget {
  Recommend() : super();

  @override
  _RecommendState createState() {
    // TODO: implement createState
    return _RecommendState();
  }
}

class _RecommendState extends State<Recommend>
    with AutomaticKeepAliveClientMixin {
  int pageNo = 1;
  int pageSize = 10;
  int total = 0;
  var mList = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  //主控件被创建的时候，会执行initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecommendBookList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext ctx, int i) {
        var mItem = mList[i];
        return GestureDetector(
            onTap: () {
              //跳转到详情
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return BookDetail(
                  id: mItem['bookId'],
                  title: mItem['bookName'],
                );
              }));
            },
            child: Container(
              margin: EdgeInsets.all(commonEdge),
              //背景装饰
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: RadialGradient(
                    //背景径向渐变
                      colors: [Colors.white, Colors.white70],
                      center: Alignment.topLeft,
                      radius: .98),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(commonCardOffsetX, commonCardOffsetY),
                        blurRadius: 4.0)
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          mItem['coverPath'],
                          width: bookWidth,
                          height: bookHeight,
                          fit: BoxFit.cover,
                        ),
                        Container(
                            height: 140,
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('书籍名称：${mItem['bookName']}'),
                                  Text('简介：${mItem['suggestDesc']}'),
                                  Text('作者：${mItem['bookAuthor']}')
                                ]))
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  getRecommendBookList() async {
    var response = await dio.post(
        "https://data.geeboodata.com:8443/api/findbook_microservice/FindbookMicroService/findbook/queryFindBookChannelList",
        data: {
          "pageNo": pageNo,
          "pageSize": pageSize,
          "appId": "1",
          "platformType": "2",
          "terminalType": "1",
          "terminalModel": "Redmi 4",
          "terminalFactory": "Xiaomi",
          "terminalSn": "8613160354392473ccef44b82db7557",
          "terminalName": "Xiaomi Redmi 4",
          "versionCode": 50271,
          "versionName": "5.3.3",
          "bigUserId": 223081,
          "findChannelId": 2
        });
    var result = response.data;
    var data = result["data"];
    if (result["status"] == 200) {
      setState(() {
        mList = data["rows"];
        total = data["total"];
      });
    } else {}
  }
}
