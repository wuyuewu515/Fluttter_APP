import 'package:json_annotation/json_annotation.dart';

part 'MyCarInfo.g.dart';

///我的车辆实体对象
@JsonSerializable()
class MyCarInfo {
//  "total": "1",
//  "rows": [{
//  "id": "1201",
//  "brand": "阿斯顿·马丁",
//  "vin": "WY004006000000001"
//  }]

  String total;
  List<CarInfo> rows;

  MyCarInfo(this.total, this.rows);


  factory MyCarInfo.fromJson(Map<String, dynamic> json) =>
      _$MyCarInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MyCarInfoToJson(this);

  @override
  String toString() {
    return 'MyCarInfo{total: $total, rows: $rows}';
  }


}

@JsonSerializable()
class CarInfo {
  String id;
  String brand;
  String vin;

  CarInfo(this.id, this.brand, this.vin);
  factory CarInfo.fromJson(Map<String, dynamic> json) =>
      _$CarInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarInfoToJson(this);

  @override
  String toString() {
    return 'CarInfo{id: $id, brand: $brand, vin: $vin}';
  }


}
