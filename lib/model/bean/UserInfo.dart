import 'package:json_annotation/json_annotation.dart';
part 'UserInfo.g.dart';

///用户的身份信息
@JsonSerializable()
class UserInfo {
//  "id": "258295667812864000",
//  "roleIds": [],
//  "userName": "135deng",
//  "tenantName": "135dengdeng",
//  "realName": "登登",
//  "tenantId": "1045"

  String id;
  String userName;
  String tenantName;
  String realName;
  String tenantId;

  UserInfo(
      this.id, this.userName, this.tenantName, this.realName, this.tenantId);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  @override
  String toString() {
    return 'UserInfo{id: $id, userName: $userName, tenantName: $tenantName, realName: $realName, tenantId: $tenantId}';
  }


}
