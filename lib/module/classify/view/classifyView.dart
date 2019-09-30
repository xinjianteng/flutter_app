import 'package:flutter/material.dart';
import 'package:flutter_app/module/classify/model/classifyTabBean.dart';
import 'package:flutter_app/module/classify/view/classifyItemView.dart';
import 'package:flutter_app/res/colors.dart';



const List<ClassifyTabBean> items = const <ClassifyTabBean>[
  const ClassifyTabBean('先秦百家', null, 1),
  const ClassifyTabBean('四书五经', null, 4),
  const ClassifyTabBean('诗词歌赋', null, 5),
];

class Classify extends StatefulWidget {
  @override
  _ClassifyState createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: items.length,
        child: Scaffold(
          appBar: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: GColors.theme_color,
            tabs: items.map((ClassifyTabBean item) {
              return new Tab(
                text: item.title,
                icon: item.icon,
              );
            }).toList(),
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          body: TabBarView(
              children: items.map((ClassifyTabBean itemView) {
            return Center(child: ClassifyItem(bookTypeId: itemView.bookTypeId));
          }).toList()),
        ));
  }
}
