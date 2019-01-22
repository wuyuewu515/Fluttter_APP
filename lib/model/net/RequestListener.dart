///网络监听回调
abstract class RequestListener {
  ///请求成功的回调
  void onSucess(int code, data);

  ///请求失败的回调
  void onFail(String errorMsg);

  ///网络请求之前
  void onSend(msg);

  ///网络请求成功，接口即将返回数据
  void onResponse();
}
