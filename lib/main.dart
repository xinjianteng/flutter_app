import 'package:flutter/material.dart';
import 'package:flutter_app/book/recommend.dart';
import 'package:flutter_app/book/shelf.dart';

void main() async{

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Tin看书';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        //app整体主题的亮度
        brightness: Brightness.light,
        //app主要部分背景色
        primaryColor: Colors.lightGreen[600],
        //前景色
        accentColor: Colors.orange[600],
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          //appbar
          title: Text("Tin看书"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://04imgmini.eastday.com/mobile/20180827/ad3de52a699e618a8292b7576e6d9486_wmk.png"),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "http://www.liulongbin.top:3005/images/bg1.jpg"),
                )),
                accountEmail: Text("492098727@qq.com"),
                accountName: Text("Tin"),
              ),
              ListTile(title: Text("用户反馈"), trailing: Icon(Icons.feedback)),
              ListTile(title: Text("系统设置"), trailing: Icon(Icons.settings)),
              ListTile(title: Text("我要发布"), trailing: Icon(Icons.send)),
              Divider(color: Color(0xFFFFD180)),
              ListTile(title: Text("注销"), trailing: Icon(Icons.send)),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.orangeAccent),
            child: TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10),
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.book),
                  text: "书架",
                ),
                Tab(
                  icon: Icon(Icons.mouse),
                  text: "推荐",
                )
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            Shelf(
              mt: "第一页",
            ),
            Recommend(),
          ],
        ),
      ),
    );
  }
}
