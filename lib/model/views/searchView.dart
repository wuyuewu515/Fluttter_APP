import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void ITextFieldCallBack(String content);

///带有删除按钮的输入框
class SearchView extends StatefulWidget {
  ///提示语
  final String hintText;

  ///控制器
  final TextEditingController textController;

  ///输入类型
  final TextInputType inputType;

  ///回调
  final ITextFieldCallBack fieldCallBack;

  const SearchView({
    Key key,
    @required this.hintText,
    @required this.textController,
    this.fieldCallBack,
    this.inputType,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InputText();
  }

  String getString() {
    return textController.text;
  }
}

class _InputText extends State<SearchView> {
  var mMaxLeng;
  bool _hasdeleteIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: new Border.all(width: 1.0, color: const Color(0xFFE6E6E6)),
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
      ),
      child: TextField(
        onChanged: _textChanged,
        controller: widget.textController,
        decoration: InputDecoration(
            prefixIcon: ImageIcon(
              AssetImage('images/sousuo.png'),
              color: const Color(0xFFB3B3B3),
            ),
            suffixIcon: _hasdeleteIcon
                ? IconButton(
                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
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
            hintStyle: TextStyle(color: const Color(0xFF999999), fontSize: 15)),
        autofocus: false,
      ),
    );
  }

  _textChanged(String text) {
    setState(() {
      _hasdeleteIcon = (widget.textController.text.isNotEmpty);
      widget.textController.selection = TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream,
          offset: widget.textController.text.length));
    });

    if (null != widget.fieldCallBack) {
      widget.fieldCallBack(text);
    }
  }
}
