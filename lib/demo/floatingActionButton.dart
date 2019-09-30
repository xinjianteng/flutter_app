import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';

///悬停按钮组件
class FloatingActionButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      //图片
      child: Icon(Icons.search),
      //长按提醒
      tooltip: 'ddd',
      //前景色：白色
      foregroundColor: Colors.white,
      //背景色：淡绿色
      backgroundColor: GColors.theme_color,
      //唯一request  点击回调事件。弹出一句提示语。
      onPressed: () {
        Scaffold.of(context).showSnackBar(new SnackBar(content: Text('搜索')));
      },
      //未点击阴影
      elevation: 5,
      //点击阴影
      highlightElevation: 7,
      //圆形边
      shape: CircleBorder(),
      //是否最小。
      mini: false,
    );
  }
}
