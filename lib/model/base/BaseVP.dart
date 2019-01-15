import 'package:kuguan_flutter/model/net/RequestListener.dart';

class BasePresenter implements RequestListener {
  final BaseView mView;

  BasePresenter(this.mView);

  @override
  void onFail(String errorMsg) {
    mView.ShowMsg(errorMsg);
  }

  @override
  void onSucess(data) {}
}

///所有的页面都需要实现的方法
abstract class BaseView {
  void ShowMsg(String msg);
}
