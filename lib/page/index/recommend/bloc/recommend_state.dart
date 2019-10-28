import 'package:equatable/equatable.dart';
import 'package:flutter_app/entity/banner_entity.dart';
import 'package:flutter_app/entity/recommend_entity.dart';
import 'package:flutter_app/entity/recommend_type_entity.dart';

abstract class RecommendState extends Equatable {
  RecommendState([List props = const []]) : super(props);
}

class RecommendUnready extends RecommendState {
  @override
  String toString() {
    return 'recommendUnready{}';
  }
}

class RecommendLoading extends RecommendState {
  @override
  String toString() {
    return 'recommendLoading{}';
  }
}

///banner数据加载完成
class ProjectBannerLoaded extends RecommendState {
  List<BannerEntity> banners;

  ProjectBannerLoaded(this.banners) : super([banners]);

  @override
  String toString() {
    return 'RecommendBannerLoaded{banners: ${banners?.length}}';
  }
}


///项目分类加载完成
class ProjectTypesLoaded extends RecommendState {
  List<RecommendTypeEntity> types;

  ProjectTypesLoaded(this.types) : super([types]);

  @override
  String toString() {
    return 'ProjectTypesLoaded{types: ${types?.length}}';
  }
}
