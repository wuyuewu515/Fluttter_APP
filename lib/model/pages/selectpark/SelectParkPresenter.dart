import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';
import 'package:kuguan_flutter/model/net/APIConstant.dart';
import 'package:kuguan_flutter/model/net/NetUtils.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectParkListContract.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';

class SelectParkPresenter extends BasePresenter
    implements I_SelectParkPresenter {
  static const int REQUEST_CODE = 1000;
  final I_SelectParkView selectView;

  SelectParkPresenter(this.selectView) : super(selectView);

  @override
  void getParkData() {
    var keyWord = selectView.getkeyWord();
    keyWord = keyWord == null ? "" : keyWord;
    Map<String, String> params = {"searchName": keyWord};
    NetUtils.getInstance()
        .getRequest(APIConstant.PARK_SEARCH, params, this, REQUEST_CODE);
  }

  @override
  void onSucess(code, data) {
    List<ParkInfo> parks = ParkInfo.getParkListList(data).toList();
    selectView.setParkData(parks);
  }

  @override
  void onClick(parkInfo) {
    accountInfo.parkInfo = parkInfo;
    LogUtils.showLog(SelectParkPresenter, accountInfo.toString());
  }
}
