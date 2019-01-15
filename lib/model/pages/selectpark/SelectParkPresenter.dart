import 'package:kuguan_flutter/model/base/BaseVP.dart';
import 'package:kuguan_flutter/model/bean/ParkInfo.dart';
import 'package:kuguan_flutter/model/net/APIConstant.dart';
import 'package:kuguan_flutter/model/net/NetUtils.dart';
import 'package:kuguan_flutter/model/pages/selectpark/SelectParkListContract.dart';

class SelectParkPresenter extends BasePresenter
    implements I_SelectParkPresenter {
  final I_SelectParkView selectView;

  SelectParkPresenter(this.selectView) : super(selectView);

  @override
  void getParkData() {
    var keyWord = selectView.getkeyWord();
    Map<String, String> params = {"searchName": keyWord};
    NetUtils.getInstance().getRequest(APIConstant.PARK_SEARCH, params, this);
  }

  @override
  void onSucess(data) {
    List<ParkInfo> parks = ParkInfo.getParkListList(data).toList();
    selectView.setParkData(parks);
  }
}
