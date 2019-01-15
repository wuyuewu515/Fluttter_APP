import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuguan_flutter/model/views/searchView.dart';

///停车场选择页面
class SelectParkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectParkPageState();
  }
}

class _SelectParkPageState extends State<SelectParkPage> {
  TextEditingController parkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '停车场选择',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          _searchView(),
        ],
      ),
    );
  }

  Widget _searchView() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setHeight(20)),
      child: SearchView(
        hintText: '请输入停车场的名称',
        textController: parkController,
      ),
    );
  }
}
