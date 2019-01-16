import 'package:flutter/widgets.dart';
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

  @override
  void ShowMsg(String msg) {
    _toast.toast(context, msg);
  }
}
