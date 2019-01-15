import 'package:json_annotation/json_annotation.dart';

part 'ResultInfo.g.dart';

///最强王者---网络请求返回的最顶级的实体对象

@JsonSerializable()
class ResultInfo {
  int state;
  String code;
  String msg;
  String friendlyMsg;
  var data;

  ResultInfo(this.state, this.code, this.msg, this.friendlyMsg,this.data);

  factory ResultInfo.fromJson(Map<String, dynamic> json) =>
      _$ResultInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResultInfoToJson(this);
}
