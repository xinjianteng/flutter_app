
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_app/entity/bmob_user_entity.dart';
import 'package:flutter_app/http/dio_util.dart';
import 'package:flutter_app/page/index/home/bloc/home_event.dart';
import 'package:flutter_app/page/index/home/bloc/home_state.dart';
import 'package:flutter_app/res/strings.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class HomeDrawer extends StatefulWidget {
  bool isLogin = false;
  String userName;
  BmobUserEntity bmobUserEntity;

  HomeDrawer(this.isLogin, this.userName, this.bmobUserEntity);

  @override
  State<StatefulWidget> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  HomeBloc homeBloc;
  bool hasSignin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    if (widget.bmobUserEntity != null) {
      checkTodayHasSignin(DateTime.parse(widget.bmobUserEntity.updatedAt));
    } else {
      hasSignin = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: homeBloc,
      listener: (context, state) {
        //
      },
      child: BlocBuilder<HomeEvent, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Container(
                height: pt(200),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/drawer_bg.jpeg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                alignment: Alignment.center,
                child: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      //打卡
                      Positioned(
                        left: pt(10),
                        top: pt(15),
                        child: widget.bmobUserEntity == null
                            ? Container()
                            : GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (!hasSignin) {
                                    hasSignin = true;
                                    BmobUserEntity copy = widget.bmobUserEntity
                                        .copyWith(
                                            level: widget.bmobUserEntity.level +
                                                1);
                                    homeBloc.dispatch(UpdateBmobInfo(copy));
                                  }
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      hasSignin ? res.signin : res.signined,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: pt(5),
                                    ),
                                    Image.asset(
                                      'images/signin.png',
                                      color: Colors.white,
                                      width: 25,
                                      height: 25,
                                    )
                                  ],
                                ),
                              ),
                      ),
                      //打卡等级排行表
                      Positioned(
                        right: pt(10),
                        top: pt(15),
                        child: widget.bmobUserEntity == null
                            ? Container()
                            : GestureDetector(
                                child: Image.asset(
                                  'images/rank.png',
                                  color: Colors.white,
                                  width: 30,
                                  height: 30,
                                ),
                                onTap: () {},
                              ),
                      ),

                      Positioned(
                        left: pt(10),
                        bottom: pt(10),
                        child: Column(
                          crossAxisAlignment: prefix0.CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                prefix0.ClipRRect(

                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _menuItem(Widget icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }

  Future checkTodayHasSignin(DateTime updateTime) async {
    ///为防止打卡作弊，当前时间从网络上获取
    DateTime now;
    try {
      Response response = await dio.get(
          'http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp');
      Map<String, dynamic> data =
          (response.data as Map<String, dynamic>)['data'];
      String todayMills = data['t'];
      now = DateTime.fromMillisecondsSinceEpoch(int.parse(todayMills),
          isUtc: true);
    } catch (e) {
      print(e);
      hasSignin = true;
      setState(() {});
      return;
    }

    DateTime today = DateTime(
      now.year,
      now.month,
      now.day,
    );
    print('$updateTime,$today');
    hasSignin = updateTime.isAfter(today.toUtc());
    setState(() {});
  }
}
