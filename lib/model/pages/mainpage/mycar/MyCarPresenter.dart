import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/net/APIConstant.dart';
import 'package:kuguan_flutter/model/net/NetUtils.dart';
import 'package:kuguan_flutter/model/pages/mainpage/mycar/MyCarContract.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';

class MyCarPresenter extends BasePresenter implements I_MycarPresenter {
  ///入库请求码
  static const int INBOUND_CODE = 1000;

  ///出库请求码
  static const int OUTBOUND_CODE = 1000;
  final I_MycarView _myCarview;

  MyCarPresenter(this._myCarview) : super(_myCarview);

  static int index = 1;

  @override
  void getData() {
    var appStatues = 'INBOUND';
    var code = INBOUND_CODE;
    int tab_index = _myCarview.getType();
    if (1 == tab_index) {
      appStatues = 'OUTBOUND';
      code = OUTBOUND_CODE;
    }

    Map<String, String> params = {
      'size': '10',
      'parkId': accountInfo.parkInfo.id,
      'appStatus': appStatues,
      'index': index.toString()
    };
    NetUtils.getInstance().getRequest(APIConstant.GET_CAR, params, this, code);
  }

  @override
  void onSucess(code, data) {
    LogUtils.showLog(MyCarPresenter, data);
  }
}
