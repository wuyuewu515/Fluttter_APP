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

  @override
  void onResponse() {
    mView.dimissLoading();
  }

  @override
  void onSend(msg) {
    mView.showLoading(msg);
  }
}

///所有的页面都需要实现的方法
abstract class BaseView {
  ///toast展示
  void ShowMsg(String msg);

  ///展示loading弹窗
  void showLoading(msg);

  ///隐藏loading弹窗
  void dimissLoading();
}
