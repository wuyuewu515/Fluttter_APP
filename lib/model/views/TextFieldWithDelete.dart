import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';

///带有删除按钮的输入框
class TextFieldWithDelete extends StatefulWidget {
  ///前面的图标
  final String iconUrl;

  ///提示语
  final String hintText;

  ///控制器
  final TextEditingController textController;

  ///最大长度
  final int maxLeng;

  ///输入类型
  final TextInputType inputType;

  final bool isPassword;

  const TextFieldWithDelete(
      {Key key,
      @required this.iconUrl,
      @required this.hintText,
      @required this.textController,
      this.isPassword,
      this.inputType,
      this.maxLeng})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InputText();
  }

  String getString() {
    return textController.text;
  }
}

class _InputText extends State<TextFieldWithDelete> {
  var mMaxLeng;
  var mInputType;
  var isPwd;
  bool _hasdeleteIcon = false;

  @override
  Widget build(BuildContext context) {
    mMaxLeng = widget.maxLeng == null ? 0 : widget.maxLeng;
    mInputType =
        widget.inputType == null ? TextInputType.text : widget.inputType;

    isPwd = widget.isPassword == null ? false : widget.isPassword;

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(65)),
                child: Image.asset(
                  widget.iconUrl,
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setHeight(35),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(30),
                      right: ScreenUtil().setWidth(80)),
                  child: TextField(
                    onChanged: _textChanged,
                    controller: widget.textController,
                    keyboardType: mInputType,
                    obscureText: isPwd,
                    decoration: InputDecoration(
                        suffixIcon: _hasdeleteIcon
                            ? IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: const Color(0xFFB3B3B3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.textController.text = '';
                                    _hasdeleteIcon = false;
                                  });
                                })
                            : Text(""),
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                            color: const Color(0xFF999999), fontSize: 15)),
                    autofocus: false,
                  ),
                ),
                //  flex: 2,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(65), 0, ScreenUtil().setWidth(65), 0),
            child: Container(
                height: ScreenUtil().setHeight(1),
                color: const Color(0xFFD9D9D9)),
          ),
        ],
      ),
    );
  }

  _textChanged(String text) {
    setState(() {
      _hasdeleteIcon = (widget.textController.text.isNotEmpty);

      LogUtils.showLog(TextFieldWithDelete, '长度的限制是--- ${mMaxLeng}');
      if (mMaxLeng == 0) return;
      if (null != mMaxLeng && null != text && text.length > mMaxLeng) {
        widget.textController.text = text.substring(0, mMaxLeng);
        widget.textController.selection = TextSelection.fromPosition(
            TextPosition(
                affinity: TextAffinity.downstream,
                offset: widget.textController.text.length));
      }
    });
  }
}
