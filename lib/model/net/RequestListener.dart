///网络监听回调
abstract class RequestListener {
  ///请求成功的回调
  void onSucess(int code,data);

  ///请求失败的回调
  void onFail(String errorMsg);
}
