import 'package:flutter/material.dart';
import 'package:flutter_app/values/colors.dart';
import 'package:flutter_app/values/dimens.dart';
import 'package:flutter_app/values/strings.dart';
import 'demo/ImageTest.dart';
import 'module/book/learn.dart';
import 'module/book/recommend.dart';
import 'module/book/shelf.dart';
import 'module/home.dart';
import 'module/login.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //是否显示纸墨设计基础布局网格，用来调试UI的工具。
      debugShowMaterialGrid: false,
      //显示性能标签
      showPerformanceOverlay: false,
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => LoginPage(),
        '/imageTest': (BuildContext context) => ImageTest(),
      },
      initialRoute: '/home',
      title: appName,
      color: null,
      theme: ThemeData(
        //app整体主题的亮度
        brightness: Brightness.light,
        //app主要部分背景色
        primaryColor: cLevelOneColor,
        //前景色
        accentColor: cLevelThereColor,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cLevelOneColor,
          title: Text("藏书馆flutter版"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
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
            height: commonBarHeight,
            decoration: BoxDecoration(
              color: cLevelOneColor,
            ),
            child: TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10),
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.book,
                    size: 20,
                  ),
                  text: "书架",
                ),
                Tab(
                  icon: Icon(
                    Icons.mouse,
                    size: 20,
                  ),
                  text: "推荐",
                ),
                Tab(
                  icon: Icon(
                    Icons.content_paste,
                    size: 20,
                  ),
                  text: "学习",
                )
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            Shelf(
              mt: "第一页",
            ),
            Recommend(),
//            LoginPage()
            Learn(),
          ],
        ),
      ),
    );
  }
}
