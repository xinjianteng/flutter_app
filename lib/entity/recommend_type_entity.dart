import 'package:json_annotation/json_annotation.dart';

part 'recommend_type_entity.g.dart';

@JsonSerializable()
class RecommendTypeEntity extends Object {

  @JsonKey(name: 'children')
  List<dynamic> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;


  RecommendTypeEntity(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory RecommendTypeEntity.fromJson(Map<String, dynamic> srcJson) => _$RecommendTypeEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendTypeEntityToJson(this);

}