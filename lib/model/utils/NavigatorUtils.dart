import 'package:flutter/material.dart';

class NavigatorUtils {
  ///跳转新页面并且关闭当前的页面
  static void goToNewPageFinishNow(_context, page) {
    PageRouteBuilder newPage = new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        // 跳转的路由对象
        return page;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return NavigatorUtils._createTransition(animation, child);
      },
    );

    Navigator.pushAndRemoveUntil(
        _context, newPage, (Route<dynamic> rout) => false);
  }

  ///跳转新页面
  static void goToNewPage(_context, page) {
    PageRouteBuilder newPage = new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        // 跳转的路由对象
        return page;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return NavigatorUtils._createTransition(animation, child);
      },
    );
    Navigator.push(_context, newPage);
  }

  static SlideTransition _createTransition(
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
