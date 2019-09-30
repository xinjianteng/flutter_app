import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/strings.dart';

///container属性测试用例
class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        //卡片大小
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
        //容器外补白
        margin: EdgeInsets.only(top: 50.0),
        //容器内补白，属于decoration的装饰范围
        padding: const EdgeInsets.all(2.0),
        //设置Container背景色与decoration不能共存
//        color: Colors.blue[600],
        //设置Container的变换矩阵  卡片倾斜变换
        transform: Matrix4.rotationZ(.2),
        ////卡片内文字居中，
        alignment: Alignment.center,
        //背景装饰
        decoration: BoxDecoration(
            color: Colors.green,
            gradient: RadialGradient(
                //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98),
            boxShadow: [
              //卡片阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        //唯一的子widget
        child: Text(
          //卡片文字
          "5.20111111111", style: TextStyle(color: Colors.red, fontSize: 40.0),
        ),
        //绘制在child前面的装饰
        foregroundDecoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image:
              NetworkImage(res.testImageUrl),
        )),
      ),
    );
  }
}
