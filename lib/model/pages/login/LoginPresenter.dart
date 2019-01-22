import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/bean/LoginInfo.dart';
import 'package:kuguan_flutter/model/bean/UserInfo.dart';
import 'package:kuguan_flutter/model/pages/login/LoginContract.dart';
import 'package:kuguan_flutter/model/net/APIConstant.dart';
import 'package:kuguan_flutter/model/net/NetUtils.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPresenter extends BasePresenter implements I_LoginPresenter {
  static const int LOGIN_CODE = 1000;
  static const int USER_CODE = 1001;
  final I_loginView loginView;

  LoginPresenter(this.loginView) : super(loginView);

  @override
  void login() {
    var name = loginView.getUserName();
    if (name.length == 0) {
      loginView.ShowMsg('请输入账号');
      return;
    }
    var pwd = loginView.getPwd();
    if (pwd.length == 0) {
      loginView.ShowMsg('请输入密码');
      return;
    }
//    map.put("grant_type", Constants.Authorize.PASSWORD);
//    map.put("username", userName);
//    map.put("password", passWord);
//    map.put("client_id", "app");
//    map.put("client_secret", "64162e70b6db443eb0af197ccf3044bd");
    Map<String, String> params = {
      'grant_type': 'password',
      'username': name,
      'password': pwd,
      'client_id': 'app',
      'client_secret': '64162e70b6db443eb0af197ccf3044bd'
    };
    NetUtils.getInstance()
        .postRequest(APIConstant.AUTHORIZE, params, this, LOGIN_CODE);

    LogUtils.showLog(LoginPresenter, '输入的账号是${name}，输入的密码是${pwd}');
  }

  @override
  Future onSucess(int code, data) {
    switch (code) {
      case LOGIN_CODE: //登录操作
        loginSucess(data);
        break;
      case USER_CODE: //获取用户信息操作
        hanldUser(data);
        break;
    }
  }

  ///登录成功的逻辑处理
  void loginSucess(data) async {
    LoginInfo loginInfo = LoginInfo.fromJson(data);
    if (null == loginInfo) return;
    //赋值登陆信息
    accountInfo.loginInfo = loginInfo;
    //获取用户的信息
    Map<String, String> params = {};
    NetUtils.getInstance()
        .getRequest(APIConstant.GET_USER, params, this, USER_CODE);

    loginView.ShowMsg('登陆成功');
    //将输入的账号密码保存到sp中
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString(StaticKey.KEY_USER_NAME, loginView.getUserName());
    prefer.setString(StaticKey.KEY_PASS_WORD, loginView.getPwd());
    prefer.setString(StaticKey.KEY_ACCESS_TOKEN, loginInfo.access_token);
  }

  ///用户逻辑处理
  void hanldUser(data) {
    UserInfo userInfo = UserInfo.fromJson(data);

    ///赋值用户信息
    accountInfo.userInfo = userInfo;
    //跳转选择停车场页面
    loginView.startNewPage();
    LogUtils.showLog(LoginPresenter, accountInfo.toString());
  }
}
