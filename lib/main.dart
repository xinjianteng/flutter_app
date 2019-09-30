import 'package:bloc/bloc.dart';
import 'package:data_plugin/bmob/bmob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/index/home/home_page.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/strings.dart';

import 'demo/testPage.dart';
import 'http/dio_util.dart';
import 'module/login.dart';

///在拿不到context的地方通过navigatorKey进行路由跳转：
///https://stackoverflow.com/questions/52962112/how-to-navigate-without-context-in-flutter-app
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  LoginPage.ROUTER_NAME: (context) => new LoginPage(),
  TestPage.ROUTER_NAME: (context) => new TestPage(),
  HomePage.ROUTER_NAME: (context) => new HomePage(),
};

bool _blocDebug = true;

class GlobalBlocDel extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    if (_blocDebug) {
      print('Bloc-event : $event');
    }
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    if (_blocDebug) {
      print('Bloc-error : $error ; $stacktrace');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (_blocDebug) {
      print('Bloc-Transition : $transition');
    }
  }
}

void main() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  BlocSupervisor.delegate = GlobalBlocDel();
  //SDK初始化
  Bmob.initMasterKey('5323c82587fd20dec226f19d856cd18a',
      '66cd8b6850d7c89c195d15808f2a9b55', 'f928c4c60652958dfe4c44379e0e7692');
  await DioUtil.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: GColors.theme_color,
      ),
      routes: routes,
      title: res.appName,
      navigatorKey: navigatorKey,
      home: HomePage(),
    );
  }
}
