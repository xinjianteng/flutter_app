import 'package:equatable/equatable.dart';
import 'package:flutter_app/entity/recommend_entity.dart';

abstract class RecommendState extends Equatable {
  RecommendState([List props = const []]) : super();
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

class RecommendLoaded extends RecommendState {
  @override
  String toString() {
    return 'recommendLoaded{}';
  }
}

class RecommendLoadError extends RecommendState {
  Exception exception;

  RecommendLoadError(this.exception) : super([exception]);
}

class RecommendDatasLoaded extends RecommendState {
  List<RecommendEntity> datas;
  int currentPage;
  int totalPage;

  RecommendDatasLoaded(this.datas, this.currentPage, this.totalPage)
      : super([datas, currentPage, totalPage]);

  @override
  String toString() {
    return 'RecommendDatasLoaded{datas: $datas, currentPage: $currentPage, totalPage: $totalPage}';
  }
}
