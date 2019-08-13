import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();

  @override
  _LoginPageState createState() {
    // TODO: implement createState
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //全局key用来获取form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  var userName;
  var password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Image(
              image: AssetImage('images/ic_launcher.png'),
              width: 00.0,
              height: 00.0,
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            )),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: new Column(
            children: <Widget>[
              Form(
                  key: loginKey,
                  child: new Column(children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(labelText: '请输入用户名'),
                      onSaved: (value) {
                        userName = value;
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: '请输入密码'),
                      onSaved: (value) {
                        password = value;
                      },
                      onFieldSubmitted: (value) {},
                      obscureText: true,
                      validator: (value) {
                        return value.length > 6 ? '密码长度不能小于6位数。' : null;
                      },
                    ),
                    Container(
                      child: new SizedBox(
                        width: 340.0,
                        height: 42.0,
                        child: new RaisedButton(
                          onPressed: login,
                          child: Text('登录'),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 20.0),
                    ),
                    RaisedButton(onPressed: (){
                      Navigator.pushNamed(context, '/imageTest');
                    })
                  ]))
            ],
          ),
        )
      ],
    );
  }

  void login() {
    var loginForm = loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      print("\n userName:" + userName + " \n password" + password);
    }
  }



}
