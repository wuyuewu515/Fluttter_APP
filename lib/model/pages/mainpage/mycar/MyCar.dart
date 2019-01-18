import 'package:flutter/material.dart';
import 'package:kuguan_flutter/model/base/BasePage.dart';

///我的车辆首页
class MyCarPage extends BasePage {
  @override
  BaseState createState() {
    return _MyCarState();
  }
}

class _MyCarState extends BaseState {
  @override
  Widget build(BuildContext context) {
    return Text('这个是我的车辆啊');
  }
}
