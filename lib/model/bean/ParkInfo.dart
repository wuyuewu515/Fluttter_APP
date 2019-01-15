import 'package:json_annotation/json_annotation.dart';

part 'ParkInfo.g.dart';

///停车场信息实体类

@JsonSerializable()
class ParkInfo {
//  "id": "11625",
//  "parkName": "停车场wy004007",
//  "longitude": "113.2719730000",
//  "latitude": "23.1175110000",
//  "supervisingPlan": "RFID",
//  "parkRadius": 4343,
//  "parkRFID": "012CFD000708FA05"

  String id;
  String parkName;
  String longitude;
  String latitude;
  String supervisingPlan;
  int parkRadius;
  String parkRFID;

  ParkInfo(this.id, this.parkName, this.longitude, this.latitude,
      this.supervisingPlan, this.parkRadius, this.parkRFID);

  factory ParkInfo.fromJson(Map<String, dynamic> json) =>
      _$ParkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ParkInfoToJson(this);

  static List<ParkInfo> getParkListList(List<dynamic> list) {
    List<ParkInfo> result = [];
    list.forEach((item) {
      result.add(ParkInfo.fromJson(item));
    });
    return result;
  }
}
