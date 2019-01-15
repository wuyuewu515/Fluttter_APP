import 'package:kuguan_flutter/model/base/BaseVP.dart';

///登陆操的逻辑处理
abstract class I_LoginPresenter {
  void login();
}

abstract class I_loginView extends BaseView {

  String getPwd();

  String getUserName();
  ///跳转新的页面
  startNewPage();
}
