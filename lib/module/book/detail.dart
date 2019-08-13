import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BookDetail extends StatefulWidget {
  final int id;
  final String title;

  BookDetail({Key key, @required this.id, @required this.title})
      : super(key: key);

  @override
  _BookDetail createState() {
    // TODO: implement createState
    return _BookDetail();
  }
}

Dio dio = new Dio();

class _BookDetail extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Text(widget.title),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetail();
  }

  void getDetail() async {
    var response = await dio.post(
      "https://data.geeboodata.com:8443/api/book_microservice/BookMicroservice/module.book/bookDetail",
      data: {
        "appId": "1",
        "platformType": "2",
        "terminalType": "1",
        "terminalModel": "Redmi 4",
        "terminalFactory": "Xiaomi",
        "terminalSn": "8613160354392473ccef44b82db7557",
        "terminalName": "Xiaomi Redmi 4",
        "versionCode": 50220,
        "versionName": "5.2.0",
        "bigUserId": 223081,
        "bookUserId": 85630005
      }
    );
  }


}
