import 'package:kuguan_flutter/model/bean/AccountInfo.dart';
import 'package:kuguan_flutter/model/net/RequestListener.dart';

class BasePresenter implements RequestListener {
  final BaseView mView;

  BasePresenter(this.mView);

  AccountInfo accountInfo = AccountInfo.getInstance();

  @override
  void onFail(String errorMsg) {
    mView.ShowMsg(errorMsg);
  }

  @override
  void onSucess(code, data) {}
}

///所有的页面都需要实现的方法
abstract class BaseView {
  void ShowMsg(String msg);
}
