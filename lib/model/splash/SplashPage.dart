import 'package:flutter/material.dart';
import 'package:kuguan_flutter/main.dart';

///splash页面，在页面停留2秒后跳转登录页面
class SplashPage extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    countDown();
    return Image.asset(
      'images/splash.png',
      fit: BoxFit.fill,
    );
  }

  ///开启倒计时
  void countDown() {
    print('开始倒计时');
    var duration = Duration(seconds: 2);
    Future.delayed(duration, goToHomePage);
  }

  ///跳转主页面
  void goToHomePage() {
    PageRouteBuilder newPage = new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        // 跳转的路由对象
      //  return MyHomePage(title: '登陆页面');
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SplashPage.createTransition(animation, child);
      },
    );

    //   Navigator.push(_context, newPage);

    Navigator.pushAndRemoveUntil(
        _context, newPage, (Route<dynamic> rout) => false);
  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}
