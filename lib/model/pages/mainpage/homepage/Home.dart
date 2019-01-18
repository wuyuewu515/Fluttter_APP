import 'package:flutter/material.dart';
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
    return Text('这个是首页啊');
  }
}
