import 'package:kuguan_flutter/model/base/BaseVP.dart';

///我的车辆
abstract class I_MycarView extends BaseView {
  void setListData(datas);
  int getType();

}

abstract class I_MycarPresenter {
  //获取车辆数据
  void getData();
}
