import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';

///登陆操的逻辑处理
abstract class I_SelectParkPresenter {
  ///获取停车场列表数据
  void getParkData();
}

abstract class I_SelectParkView extends BaseView {


  ///获取用户输入的关键字
  getkeyWord();


  ///设置停车场列表数据
 void setParkData(List<ParkInfo> datas);
}
