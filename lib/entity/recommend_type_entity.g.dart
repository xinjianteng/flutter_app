// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendTypeEntity _$RecommendTypeEntityFromJson(Map<String, dynamic> json) {
  return RecommendTypeEntity(
    json['children'] as List,
    json['courseId'] as int,
    json['id'] as int,
    json['name'] as String,
    json['order'] as int,
    json['parentChapterId'] as int,
    json['userControlSetTop'] as bool,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$RecommendTypeEntityToJson(RecommendTypeEntity instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
