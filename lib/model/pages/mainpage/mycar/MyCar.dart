import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';
import 'package:kuguan_flutter/model/pages/mainpage/mycar/MyCarContract.dart';
import 'package:kuguan_flutter/model/pages/mainpage/mycar/MyCarPresenter.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';
import 'package:kuguan_flutter/model/views/searchView.dart';

///我的车辆首页
class MyCarPage extends BasePage {
  @override
  BaseState createState() {
    return _MyCarState();
  }
}

class _MyCarState extends BaseState
    with SingleTickerProviderStateMixin
    implements I_MycarView {
  var listItems = List<ParkInfo>();
  MyCarPresenter _presenter;
  TextEditingController vinController = TextEditingController();
  TabController _tabController;
  SearchView searchView;

  @override
  void initState() {
    super.initState();
    _presenter = MyCarPresenter(this);
    searchView = SearchView(
        hintText: '请输入车架号',
        textController: vinController,
        fieldCallBack: (text) {
          //    _presenter.getData();
        });
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(onChanged);

    _presenter.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE6E6E6),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
            child: searchView,
          ),
          _buildTabView(),
        ],
      ),
    );
  }

  Widget _buildTabView() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(88),
      child: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF2D8BFF),
          labelStyle: TextStyle(fontSize: 15),
          unselectedLabelColor: Color(0xFF999999),
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelStyle: TextStyle(fontSize: 14),
          isScrollable: false,
          tabs: [
            Center(
              child: Text(
                '出库(10)',
              ),
            ),
            Center(
              child: Text('入库(10)'),
            )
          ]),
    );
  }

  var position = 0;

  void onChanged() {
    if (position == _tabController.index) return;
    position = _tabController.index;
    _presenter.getData();
    LogUtils.showLog(MyCarPage, '当前选中的是${_tabController.index}');
  }

  @override
  void setListData(datas) {}

  @override
  void dispose() {
    super.dispose();
    vinController.dispose();
    _tabController.dispose();
  }

  @override
  int getType() {
    return _tabController.index;
  }
}
