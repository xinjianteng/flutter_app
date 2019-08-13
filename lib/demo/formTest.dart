import 'package:flutter/material.dart';

class FormTest extends StatelessWidget {
  //全局key用来获取form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  var userName;
  var password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginKey,
        child: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: InputDecoration(labelText: '账号'),
              onSaved: (value) {
//                调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
              },
              validator: (value) {
//                调用此方法后，会调用Form子孙FormField的validate回调，
//                如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
                if(value.length<6){
                  return "";
                }
                return null;
              },
              // 编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件。
              // 大多数情况下我们都需要显式提供一个controller来与文本框交互。
              // 如果没有提供controller，则TextField内部会自动创建一个。
              controller: TextEditingController(),
            ),
            new TextFormField(
              decoration: new InputDecoration(labelText: '密码'),
            )
          ],
        ));
  }
}
