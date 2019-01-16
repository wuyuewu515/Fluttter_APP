import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/utils/Toast.dart';

///基类
abstract class BasePage extends StatefulWidget {
  @override
  BaseState createState();
}

class BaseState extends State<BasePage> implements BaseView {
  Toast _toast;

  @override
  void initState() {
    super.initState();
    _toast = Toast();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {}

  ///展示提示信息
  @override
  void ShowMsg(String msg) {
    _toast.toast(context, msg);
  }

  Widget getEmptyView() {
    return Container(
      color: const Color(0xFFE6E6E6),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(280)),
          ),
          Image(
            image: AssetImage('images/icon_empty.png'),
            height: ScreenUtil().setHeight(295),
            width: ScreenUtil().setWidth(375),
            fit: BoxFit.fill,
          ),
          Text('暂无数据'),
        ],
      ),
    );
  }
}
