import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';
import 'package:kuguan_flutter/model/views/HomeButton.dart';

///首页
class HomePage extends BasePage {
  @override
  BaseState createState() {
    return _HomePageState();
  }
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
    );

    chukuButton = HomeButton(
      title: '出库',
      subTitle: 'Deliver',
      iconUrl: 'images/chuku.png',
    );
    qingdianButton = HomeButton(
      title: '清点',
      subTitle: 'Check',
      iconUrl: 'images/qingdian.png',
    );
    tihuanButton = HomeButton(
      title: '替换',
      subTitle: 'Replace',
      iconUrl: 'images/tihuan.png',
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

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: const Color(0xFFE6E6E6),
      alignment: Alignment.topCenter,
      child: Card(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: ScreenUtil().setHeight(250),
            maxWidth: ScreenUtil().setWidth(710),
          ),
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
          height: ScreenUtil().setWidth(250),
          width: ScreenUtil().setHeight(710),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Image.asset(
                  'images/chuku.png',
                  height: ScreenUtil().setHeight(150),
                  width: ScreenUtil().setWidth(240),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '入库',
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF333333)),
                    ),
                    Text(
                      'Store',
                      style: TextStyle(
                          fontSize: 9, color: const Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
