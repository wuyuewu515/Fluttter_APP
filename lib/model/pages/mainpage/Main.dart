import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';
import 'package:kuguan_flutter/model/pages/mainpage/homepage/Home.dart';
import 'package:kuguan_flutter/model/pages/mainpage/mine/Mine.dart';
import 'package:kuguan_flutter/model/pages/mainpage/mycar/MyCar.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';

///主界面
class MainPage extends BasePage {
  final String homeTile;

  MainPage(this.homeTile);

  @override
  _MainPageState createState() {
    return _MainPageState(homeTile);
  }
}

class _MainPageState extends BaseState with SingleTickerProviderStateMixin {
  TabController _tabController;
  final title;

  ///当前的位置
  int position = 0;

  _MainPageState(this.title);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(onChange);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [HomePage(), MyCarPage(), MinePage()],
          controller: _tabController,
        ),
        bottomNavigationBar: Container(
          height: ScreenUtil().setHeight(100),
          color: Colors.white,
          child: TabBar(
            indicatorWeight: 1,
            controller: _tabController,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Color(0xFF333333),
            labelColor: Color(0xFF2D8BFF),
            tabs: [
              bottomTab(
                  position == 0
                      ? 'images/home_check.png'
                      : 'images/home_normal.png',
                  '首页'),
              bottomTab(
                  position == 1
                      ? 'images/mycar_check.png'
                      : 'images/mycar_normal.png',
                  '我的车辆'),
              bottomTab(
                  position == 2
                      ? 'images/personal_check.png'
                      : 'images/personal_normal.png',
                  '我的'),
            ],
          ),
        ),
      ),
    );
  }

  ///底部的选项卡
  Widget bottomTab(iconUrl, String text) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset(
            iconUrl,
            height: ScreenUtil().setHeight(45),
            width: ScreenUtil().setWidth(45),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  void onChange() {
    if (position == _tabController.index) return;
    position = _tabController.index;
    LogUtils.showLog(MainPage, '当前选中的位置是${_tabController.index}');
    setState(() {});
  }
}
