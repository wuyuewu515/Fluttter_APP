import 'package:kuguan_flutter/model/bean/LoginInfo.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';
import 'package:kuguan_flutter/model/bean/UserInfo.dart';

///用户的账号信息，包括用户信息，登录信息，和停车场信息
class AccountInfo {
  ///登陆信息
  LoginInfo _loginInfo;

  ///停车场信息
  ParkInfo _parkInfo;

  /// 用户信息
  UserInfo _userInfo;

  static AccountInfo _accountInfo;

  static AccountInfo getInstance() {
    if (_accountInfo == null) {
      _accountInfo = AccountInfo();
    }
    return _accountInfo;
  }

  LoginInfo get loginInfo => _loginInfo;

  set loginInfo(LoginInfo value) {
    _loginInfo = value;
  }

  ParkInfo get parkInfo => _parkInfo;

  set parkInfo(ParkInfo value) {
    _parkInfo = value;
  }

  UserInfo get userInfo => _userInfo;

  set userInfo(UserInfo value) {
    _userInfo = value;
  }

  @override
  String toString() {
    return 'AccountInfo{_loginInfo: $_loginInfo, _parkInfo: $_parkInfo, _userInfo: $_userInfo}';
  }
}
