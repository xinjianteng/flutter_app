import 'package:equatable/equatable.dart';
import 'package:flutter_app/entity/bmob_user_entity.dart';

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


class UpdateBmobInfo extends HomeEvent{
  BmobUserEntity bmobUserEntity;

  UpdateBmobInfo(this.bmobUserEntity) : super([bmobUserEntity]);

  @override
  String toString() {
    return 'UpdateBmobInfo{bmobUserEntity: $bmobUserEntity}';
  }
}
