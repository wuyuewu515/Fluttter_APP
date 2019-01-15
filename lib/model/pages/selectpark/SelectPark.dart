import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectParkListContract.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectParkPresenter.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';
import 'package:kuguan_flutter/model/utils/Toast.dart';
import 'package:kuguan_flutter/model/views/searchView.dart';

///停车场选择页面
class SelectParkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectParkPageState();
  }
}

class _SelectParkPageState extends State<SelectParkPage>
    implements I_SelectParkView {
  var listItems = List<ParkInfo>();
  var _hasData = false;
  SelectParkPresenter _presenter;
  TextEditingController parkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _presenter = SelectParkPresenter(this);
    _presenter.getParkData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '停车场选择',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: Container(
        color: const Color(0xFFE6E6E6),
        child: Column(
          children: <Widget>[
            _searchView(),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: _hasData ? _listBuild() : _searchView(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _listBuild() {
    return ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return _itemBuild(index);
        });
  }

  Widget _searchView() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setHeight(20)),
      child: SearchView(
        hintText: '请输入停车场的名称',
        textController: parkController,
      ),
    );
  }

  Widget _itemBuild(int index) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setHeight(20)),
                  height: ScreenUtil().setHeight(88),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    listItems[index].parkName,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(25)),
                child: Image.asset('images/icon_arrow_right.png'),
              ),
            ],
          ),
          Container(
            height: 1,
            color: const Color(0xFFE6E6E6),
          ) //下划线
        ],
      ),
      onTap: () {
        _onClick(listItems[index].parkName);
      },
    );
  }

  @override
  void ShowMsg(String msg) {
    Toast.toast(context, msg);
  }

  @override
  getkeyWord() {
    return parkController.text;
  }

  @override
  void setParkData(List<ParkInfo> datas) {
    setState(() {
      _hasData = datas.length > 0;
      listItems = datas;
    });
  }

  _onClick(String parkName) {
    //跳转停车场页面
    ShowMsg(parkName);
    LogUtils.showLog(SelectParkPage, '选择的停车场是${parkName}');

    setState(() {});
  }
}
