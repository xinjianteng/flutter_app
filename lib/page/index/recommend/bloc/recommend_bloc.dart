import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/page/index/home/bloc/home_bloc.dart';
import 'package:flutter_app/page/index/home/bloc/home_state.dart';
import 'package:flutter_app/page/index/recommend/bloc/recommend_event.dart';
import 'package:flutter_app/page/index/recommend/bloc/recommend_state.dart';

class RecommendBloc extends Bloc<RecommendEvent, RecommendState> {
  HomeBloc homeBloc;
  StreamSubscription subscription;

  RecommendBloc(this.homeBloc) {
    print('recommend bloc constra');
    subscription = homeBloc.state.listen((state) {
      if (state is HomeLoaded) {
        print('项目子页，主页加载完成，开始加载子页');
        dispatch(LoadRecommend());
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // TODO: implement initialState
  RecommendState get initialState => RecommendUnready();

  @override
  Stream<RecommendState> mapEventToState(RecommendEvent event) async* {
    if (event is LoadRecommend) {
      yield* _mapLoadRecommendToState();
    }
  }

  Stream<RecommendState> _mapLoadRecommendToState() {


  }


}
