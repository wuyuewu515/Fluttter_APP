import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';

///
/// @author tsing
/// @time 2019/1/22 下午2:33
///
class LoadingDialog {
  OverlayEntry _overlayEntry; //toast靠它加到屏幕上
  bool _showing = false; //toast是否正在showing
  String _msg;

  void show(
    BuildContext context,
    String msg,
  ) async {
    assert(msg != null);
    _msg = msg;
    _showing = true;

    double width = MediaQuery.of(context).size.width;
    LogUtils.showLog(LoadingDialog, '${width}');

    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Align(
                //top值，可以改变这个值来改变toast在屏幕中的位置
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: _showing ? _buildLoadingWidget() : Text(''),
                ),
              ));
      overlayState.insert(_overlayEntry);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
  }

  void dimiss() {
    _showing = false;
    if (null != _overlayEntry) _overlayEntry.markNeedsBuild();
  }

  //dialog绘制
  _buildLoadingWidget() {
    return Card(
        color: Colors.grey[600],
        child: Container(
          height: ScreenUtil().setHeight(260),
          width: ScreenUtil().setWidth(260),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(40))),
              Text(
                _msg,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
