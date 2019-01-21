import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///主页的按钮显示
class HomeButton extends StatefulWidget {
  ///图片地址
  final String iconUrl;

  ///主标题
  final String title;

  ///副标题
  final String subTitle;

  ///点击回调
  final HomeButtonClick buttonClick;

  const HomeButton(
      {Key key,
      @required this.iconUrl,
      @required this.title,
      @required this.subTitle,
      this.buttonClick})
      : super(key: key);

  @override
  _HomeButtonState createState() {
    return _HomeButtonState();
  }
}

///点击回调接口
typedef void HomeButtonClick();

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.buttonClick,
      child: Container(
        alignment: Alignment.topCenter,
        child: Card(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: ScreenUtil().setHeight(250),
              maxWidth: ScreenUtil().setWidth(710),
            ),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            height: ScreenUtil().setWidth(250),
            width: ScreenUtil().setHeight(710),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    widget.iconUrl,
                    height: ScreenUtil().setHeight(150),
                    width: ScreenUtil().setWidth(240),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 17, color: const Color(0xFF333333)),
                      ),
                      Text(
                        widget.subTitle,
                        style: TextStyle(
                            fontSize: 9, color: const Color(0xFF333333)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
