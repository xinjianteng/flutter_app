import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

///加载主页数据
class LoadHome extends HomeEvent {
  @override
  String toString() {
    return 'loadHome';
  }
}

class logoutHome extends HomeEvent {
  @override
  String toString() {
    return 'logoutHome';
  }
}
