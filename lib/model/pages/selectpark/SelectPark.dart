import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectParkListContract.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectParkPresenter.dart';
import 'package:kuguan_flutter/model/views/searchView.dart';

///停车场选择页面
class SelectParkPage extends BasePage {
  @override
  _SelectParkPageState createState() {
    return _SelectParkPageState();
  }
}

class _SelectParkPageState extends BaseState implements I_SelectParkView {
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
                child: _hasData ? _listBuild() : getEmptyView(),
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
        fieldCallBack: (text) {
          _presenter.getParkData();
        },
      ),
    );
  }

  Widget _itemBuild(int index) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: ListTile(
            onTap: () {
              _onClick(listItems[index].parkName);
            },
            title: Text(
              listItems[index].parkName,
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xFF333333),
              ),
            ),
            trailing: Image.asset('images/icon_arrow_right.png'),
          ),
        ),
        Container(
          height: 1,
          color: const Color(0xFFE6E6E6),
        ) //下划线
      ],
    );
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
    //  LogUtils.showLog(SelectParkPage, '选择的停车场是${parkName}');
  }
}
