import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/pages/login/LoginContract.dart';
import 'package:kuguan_flutter/model/net/APIConstant.dart';
import 'package:kuguan_flutter/model/net/NetUtils.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPresenter extends BasePresenter implements I_LoginPresenter {
  final I_loginView loginView;

  LoginPresenter(this.loginView) : super(loginView);

  @override
  void login() {
    loginView.startNewPage();

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
    NetUtils.getInstance().postRequest(APIConstant.AUTHORIZE, params, this);

    LogUtils.showLog(LoginPresenter, '输入的账号是${name}，输入的密码是${pwd}');
  }

  @override
  Future onSucess(data) async {
    loginView.ShowMsg('登陆成功');
    //将输入的账号密码保存到sp中
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('userName', loginView.getUserName());
    prefer.setString('passWord', loginView.getPwd());
    //跳转选择停车场页面
    loginView.startNewPage();
    LogUtils.showLog(LoginPresenter, '返回的结果是' + data.toString());
  }
}
