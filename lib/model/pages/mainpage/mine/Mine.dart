import 'package:flutter/material.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';

///个人中心首页
class MinePage extends BasePage {
  @override
  BaseState createState() {
    return _MineState();
  }
}

class _MineState extends BaseState {
  @override
  Widget build(BuildContext context) {
    return Text('这个是个人中心啊');
  }
}
