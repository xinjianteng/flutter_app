import 'package:flutter/material.dart';
import 'package:flutter_app/entity/bmob_user_entity.dart';
import 'package:flutter_app/page/base/custom_sliver_app_bar_delegate.dart';
import 'package:flutter_app/page/index/recommend/recommend_page.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/strings.dart';
import 'package:flutter_app/utils/display_util.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/view/loading_view.dart';
import 'package:flutter_app/view/saerch_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'home_drawer.dart';

class HomePage extends StatefulWidget {
  static const String ROUTER_NAME = "/HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  BuildContext innerContext;
  HomeBloc homeBloc = HomeBloc();
  bool isLogin = false;
  String userName;
  BmobUserEntity bmobUserEntity;

  TabController _tabController;
  ScrollController _scrollController;
  TextEditingController _searchTextContriller;

  static List<PageStorageKey<String>> keys = [
    PageStorageKey<String>('1'),
    PageStorageKey<String>('2'),
    PageStorageKey<String>('3'),
  ];

  //实际上如果子页已经AutomaticKeepAliveClientMixin了，
  // 那也没必要再用PageStorageKey去保存滚动状态了，因为切换tab时页面根本不会被销毁
  Map<String, Widget> tabs = {
    res.tabRecommend: RecommendPage(keys[0]),
    res.tabRecommend: RecommendPage(keys[1]),
    res.tabRecommend: RecommendPage(keys[2]),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {});
    _scrollController = ScrollController();
    _searchTextContriller = TextEditingController();
    homeBloc.dispatch(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    return new BlocProviderTree(
      blocProviders: [
        BlocProvider<HomeBloc>(
          builder: (context) => homeBloc,
        )
      ],
      child: BlocListener(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeLoadError) {
            if (innerContext != null) {
              DisplayUtil.showMsg(innerContext, exception: state.exception);
            }
          }
          if (state is HomeLoaded) {
            isLogin = state.isLogin;
            userName = state.userName;
          }
          if (state is HomeBmobLoaded) {
            bmobUserEntity = state.bmobUserEntity;
          }
        },
        child: BlocBuilder<HomeEvent, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  Scaffold(
                    body: Builder(builder: (context) {
                      innerContext = context;
                      return Stack(
                        children: <Widget>[
                          DecoratedBox(
                            decoration: _themeGradientDecoration(),
                            child: SafeArea(
                              child: NestedScrollView(
                                controller: _scrollController,
                                headerSliverBuilder: (BuildContext context,
                                    bool innerBoxIsScrolled) {
                                  return <Widget>[
                                    SliverToBoxAdapter(
                                      child: Container(
                                        decoration: _themeGradientDecoration(),
                                        child: appBarHeader(),
                                      ),
                                    ),
                                    SliverPersistentHeader(
                                        pinned: true,
                                        floating: true,
                                        delegate: CustomSliverAppBarDelegate(
                                            minHeight: pt(40),
                                            maxHeight: pt(40),
                                            child: Container(
                                              height: pt(40),
                                              decoration:
                                                  _themeGradientDecoration(),
                                              child: appBarTab(_tabController),
                                            )))
                                  ];
                                },
                                body: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(pt(10)),
                                      topRight: Radius.circular(pt(10)),
                                    ),
                                  ),
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: tabs.values
                                          .map((page) => page)
                                          .toList()),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                    drawer: Drawer(
                      child: HomeDrawer(
                        isLogin,
                        userName,
                        bmobUserEntity,
                      ),
                    ),
                    floatingActionButton: Offstage(
                      offstage: false,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset('images/rocket.png'),
                        ),
                        mini: true,
                        backgroundColor: GColors.theme_color,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: state is! HomeLoading,
                    child: getLoading(start: state is HomeLoading),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Decoration _themeGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          GColors.theme_color,
          GColors.theme_color_light,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    );
  }

  Widget appBarHeader() {
    return Container(
      height: pt(60),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Scaffold.of(innerContext).openDrawer();
            },
            child: Container(
              width: pt(34),
              height: pt(34),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: pt(17)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(pt(17)),
                child: isLogin
                    ? Image.asset(
                        'images/user_icon.jpeg',
                        fit: BoxFit.cover,
                        width: pt(34),
                        height: pt(34),
                      )
                    : Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: pt(34),
                      ),
              ),
            ),
          ),
          Expanded(
            child: Hero(
              tag: 'searchBar',
              child: Material(
                type: MaterialType.transparency,
                child: SearchBar(
                  height: pt(30),
                  color: Colors.grey[50],
                  iconColor: GColors.wechat_green,
                  icon: null,
                  child: TextField(
                    controller: _searchTextContriller,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (text) {},
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        hintText: res.searchTips,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(),
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: GColors.hint_color_dark,
                        )),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: pt(12), right: pt(6)),
              child: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarTab(TabController tabController) {
    return TabBar(
        isScrollable: true,
        controller: tabController,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: tabs.keys.map((title) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: pt(10),
              horizontal: pt(6),
            ),
            child: Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          );
        }).toList());
  }
}
