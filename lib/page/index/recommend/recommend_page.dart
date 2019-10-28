import 'package:flutter/material.dart';
import 'package:flutter_app/entity/banner_entity.dart';
import 'package:flutter_app/entity/recommend_type_entity.dart';
import 'package:flutter_app/entity/recommend_entity.dart';
import 'package:flutter_app/entity/todo_entity.dart';
import 'package:flutter_app/page/index/home/bloc/home_bloc.dart';
import 'package:flutter_app/page/index/recommend/bloc/recommend_event.dart';
import 'package:flutter_app/page/index/recommend/bloc/recommend_state.dart';
import 'package:flutter_app/page/index/recommend/recommend_item.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/utils/index.dart';
import 'package:flutter_app/view/loading_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/recommend_bloc.dart';

class RecommendPage extends StatefulWidget {
  PageStorageKey pageStorageKey;

  RecommendPage(this.pageStorageKey);

  @override
  State<StatefulWidget> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  RecommendBloc recommendBloc;
  int currentProjectPage;
  int totalProjectPage;
  List<BannerEntity> banners;
  List<RecommendTypeEntity> projectTypes;
  List<RecommendEntity> projectDatas;
  List<TodoEntity> todoDatas;

  ///不能直接使用[RecommendLoading]作为是否在加载的依据，原因见[ProjectBloc]
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recommendBloc = RecommendBloc(BlocProvider.of<HomeBloc>(context));
    banners ??= [];
    projectTypes ??= [];
    projectDatas ??= [];
    todoDatas ??= [];
    currentProjectPage ??= 1;
    totalProjectPage ??= 1;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<RecommendBloc>(
          builder: (context) => recommendBloc,
        ),
      ],
      child: BlocListenerTree(
          blocListeners: [
            BlocListener<RecommendEvent,RecommendState>(
              bloc: recommendBloc,
              listener: (context, state) {

                if (state is RecommendLoading) {
                  isLoading = true;
                } else if (state is RecommendLoaded ||
                    state is RecommendLoadError) {
                  isLoading = false;
                }

                if (state is RecommendDatasLoaded) {
                  currentProjectPage = state.currentPage;
                  totalProjectPage = state.totalPage;
                  recommendDatas = state.datas;
                } else if (state is RecommendLoadError) {
                  DisplayUtil.showMsg(context, exception: state.exception);
                }
              },
            ),
          ],
          child: BlocBuilder(
            bloc: recommendBloc,
            builder: (context, state) {
              return NotificationListener(
                onNotification: (notification) {
                  return false;
                },
                child: Stack(
                  children: <Widget>[
                    RefreshIndicator(
                      onRefresh: () async {
                        if (!isLoading) {
                          recommendBloc.dispatch(LoadRecommend());
                        }
                        return;
                      },
                      child: CustomScrollView(
                        key: widget.pageStorageKey,
                        slivers: <Widget>[
                          recommendGrid(datas: recommendDatas),
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: !isLoading,
                      child: getLoading(start: isLoading),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }

  Widget recommendGrid({List<RecommendEntity> datas = const []}) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            color: GColors.gray_background,
            padding: index % 2 == 0
                ? EdgeInsets.only(
                    left: pt(12),
                    right: pt(6),
                    top: pt(6),
                    bottom: pt(6),
                  )
                : EdgeInsets.only(
                    left: pt(6),
                    right: pt(12),
                    top: pt(6),
                    bottom: pt(6),
                  ),
            child: RecommendItem(
              isLoading,
              datas[index],
            ),
          );
        },
        childCount: datas.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
    );
  }
}
