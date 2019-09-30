import 'package:equatable/equatable.dart';

class RecommendEvent extends Equatable {
  RecommendEvent([List props = const []]) : super();
}

class LoadRecommend extends RecommendEvent {
  @override
  String toString() {
    // TODO: implement toString
    return 'LoadRecommend{}';
  }
}
