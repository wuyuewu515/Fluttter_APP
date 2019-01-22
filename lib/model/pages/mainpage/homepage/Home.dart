import 'package:flutter/material.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';
import 'package:kuguan_flutter/model/views/HomeButton.dart';

///首页
class HomePage extends BasePage {
  @override
  BaseState createState() {
    return _HomePageState();
  }
}

enum EnterType {
  chuku, //出库
  ruku, //入库
  qingdian, //清点
  tihuan, //替换
}

class _HomePageState extends BaseState {
  var rukuButton;
  var chukuButton;
  var qingdianButton;
  var tihuanButton;

  @override
  void initState() {
    super.initState();
    rukuButton = HomeButton(
      title: '入库',
      subTitle: 'Store',
      iconUrl: 'images/ruku.png',
      buttonClick: () {
        _enter(EnterType.ruku);
      },
    );

    chukuButton = HomeButton(
      title: '出库',
      subTitle: 'Deliver',
      iconUrl: 'images/chuku.png',
      buttonClick: () {
        _enter(EnterType.chuku);
      },
    );
    qingdianButton = HomeButton(
      title: '清点',
      subTitle: 'Check',
      iconUrl: 'images/qingdian.png',
      buttonClick: () {
        _enter(EnterType.qingdian);
      },
    );
    tihuanButton = HomeButton(
      title: '替换',
      subTitle: 'Replace',
      iconUrl: 'images/tihuan.png',
      buttonClick: () {
        _enter(EnterType.tihuan);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE6E6E6),
      child: ListView(
        children: <Widget>[
          rukuButton,
          chukuButton,
          qingdianButton,
          tihuanButton
        ],
      ),
    );
  }

  ///跳转相关页面
  _enter(EnterType enterType) {
    String result = '';
    switch (enterType) {
      case EnterType.ruku:
        result = '入库';
        break;
      case EnterType.chuku:
        result = '出库';
        break;
      case EnterType.qingdian:
        result = '清点';
        break;
      case EnterType.tihuan:
        result = '替换';
        break;
    }
    ShowMsg(result);
  }
}
