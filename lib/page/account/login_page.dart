import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/strings.dart';
import 'package:flutter_app/utils/display_util.dart';
import 'package:flutter_app/utils/screen_utils.dart';

///页面的模式
enum LoginMode {
  ///登录账户
  LOGIN,

  ///注册账户
  REGISTER,
}

//自定义通知
class LoginModeNotification extends Notification {
  final LoginMode mode;

  LoginModeNotification(this.mode);
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginMode mode;
  AnimationController animationController;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 1));
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut);
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.theme_color_dark,
        elevation: 0,
        centerTitle: true,
        title: Text(mode == LoginMode.LOGIN ? res.login : res.register),
      ),
      body: NotificationListener<LoginModeNotification>(
        onNotification: (notification) {
          setState(() {
            mode = notification.mode;
          });
        },
        child: Container(
          color: GColors.gray_background,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: pt(200),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        GColors.theme_color_dark,
                        GColors.theme_color,
                        GColors.theme_color_light
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: pt(50),
                  child: Image.asset(
                    'images/ic_launcher.png',
                    color: Colors.white,
                  ),
                ),
                ScaleTransition(
                  scale: curvedAnimation,
                  child: Container(
                    margin: EdgeInsets.only(top: pt(70)),
                    child: LoginCard(
                      mode: mode,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  bool isLogining;
  LoginMode mode;

  LoginCard({
    this.isLogining = false,
    this.mode = LoginMode.LOGIN,
  });

  @override
  State<StatefulWidget> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: <BoxShadow>[
          DisplayUtil.lightElevation(),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
            topRight: Radius.elliptical(25, 25),
            bottomLeft: Radius.elliptical(25, 25),
          ),
        ),
      ),
      child: Container(
        width: pt(300),
        padding: EdgeInsets.all(
          pt(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: pt(16),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
