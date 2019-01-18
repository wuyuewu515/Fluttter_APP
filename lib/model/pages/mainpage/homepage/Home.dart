import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';

///首页
class HomePage extends BasePage {
  @override
  BaseState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseState {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
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

  Widget _buildCard() {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          child: SizedBox(
            height: ScreenUtil().setHeight(950),
            width: ScreenUtil().setWidth(690),
            child: Card(
              color: Colors.white,
              elevation: 3.0,
              margin: EdgeInsets.all(ScreenUtil().setWidth(30)),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(95),
                          ScreenUtil().setHeight(180),
                          ScreenUtil().setWidth(95),
                          0)),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(95),
                          ScreenUtil().setHeight(40),
                          ScreenUtil().setWidth(95),
                          0)),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                    width: ScreenUtil().setWidth(145),
                    height: ScreenUtil().setHeight(130),
                    child: Image.asset(
                      'images/logo.png',
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),
              ScreenUtil().setWidth(335), ScreenUtil().setWidth(30), 0),
        ));
  }
}
