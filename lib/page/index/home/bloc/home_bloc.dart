import 'package:bloc/bloc.dart';
import 'package:flutter_app/utils/shared_preference_util.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool isLogin = false;
  String userName;

  bool alredyHomeloaded = false;

  @override
  HomeState get initialState => HomeLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHome) {
      yield* _mapLoadHomeToState();
    }
  }

  Stream<HomeState> _mapLoadHomeToState() async* {
    alredyHomeloaded = false;
    yield HomeLoading();
    isLogin = await SPUtil.isLogin();
    if (isLogin) {
      userName = await SPUtil.getUserName();
    } else {
      userName = null;
    }
  }
}
