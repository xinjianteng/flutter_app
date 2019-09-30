import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity/recommend_entity.dart';

class RecommendItem extends StatefulWidget {
  bool isLoading;
  RecommendEntity recommendEntity;

  RecommendItem(this.isLoading, this.recommendEntity);

  @override
  _RecommendItemState createState() => _RecommendItemState();
}

class _RecommendItemState extends State<RecommendItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 0.5,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.recommendEntity.bookCover,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
