import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/pages/login/LoginContract.dart';
import 'package:kuguan_flutter/model/pages/login/LoginPresenter.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectPark.dart';
import 'package:kuguan_flutter/model/utils/Toast.dart';
import 'package:kuguan_flutter/model/views/TextFieldWithDelete.dart';

///登陆页面
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> implements I_loginView {
  static const LOGO = "images/icon_login_logo.png";

  var userInput;
  var pwdInput;
  LoginPresenter _loginPresenter;
  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginPresenter = LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    userInput = TextFieldWithDelete(
      hintText: '请输入账号',
      iconUrl: 'images/icon_login_username.png',
      textController: userController,
      maxLeng: 15,
    );
    pwdInput = TextFieldWithDelete(
      hintText: '请输入密码',
      iconUrl: 'images/icon_login_password.png',
      inputType: TextInputType.number,
      textController: pwdController,
      maxLeng: 10,
      isPassword: true,
    );

    return Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(500),
              child: Image.asset(
                'images/login_background.png',
                fit: BoxFit.fill,
              ),
            ),
            Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        _buildCard(),
                        _buildIcon(),
                      ],
                    ),
                  ],
                )),
          ],
        ));
  }

  ///构建图标
  Widget _buildIcon() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        child: Image.asset(
          LOGO,
          height: ScreenUtil().setHeight(180),
          width: ScreenUtil().setHeight(180),
        ),
        padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(280), 0, 0),
      ),
    );
  }

  ///构建悬浮的卡片
  Widget _buildCard() {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          child: SizedBox(
            height: ScreenUtil().setHeight(950),
            width: ScreenUtil().setWidth(690),
            child: Card(
              color: Colors.white,
              elevation: 3.0,
              margin: EdgeInsets.all(ScreenUtil().setWidth(30)),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(95),
                          ScreenUtil().setHeight(180),
                          ScreenUtil().setWidth(95),
                          0)),
                  userInput,
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(95),
                          ScreenUtil().setHeight(40),
                          ScreenUtil().setWidth(95),
                          0)),
                  pwdInput,
                  buildLoginBoutton(),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                    width: ScreenUtil().setWidth(145),
                    height: ScreenUtil().setHeight(130),
                    child: Image.asset(
                      'images/logo.png',
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),
              ScreenUtil().setWidth(335), ScreenUtil().setWidth(30), 0),
        ));
  }

  ///登录按钮
  Widget buildLoginBoutton() {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(160)),
        width: ScreenUtil().setWidth(560),
        height: ScreenUtil().setHeight(85),
        child: Material(
            borderRadius: BorderRadius.circular(3.0),
            elevation: ScreenUtil().setWidth(5),
            shadowColor: const Color(0x802D8BFF),
            color: const Color(0xFF2D8BFF),
            child: MaterialButton(
              onPressed: () {
                _login();
              },
              textColor: Colors.white,
              child: Text(
                '登录',
                style: TextStyle(fontSize: 15),
              ),
            )));
  }

  ///登录操作
  void _login() {
    _loginPresenter.login();
  }

  @override
  String getPwd() {
    return pwdController.text;
  }

  @override
  String getUserName() {
    return userController.text;
  }

  @override
  void ShowMsg(msg) {
    Toast.toast(context, msg);
  }

  @override
  startNewPage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SelectParkPage()),
        (route) => route == null);
  }
}
