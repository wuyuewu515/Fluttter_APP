// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ParkInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkInfo _$ParkInfoFromJson(Map<String, dynamic> json) {
  return ParkInfo(
      json['id'] as String,
      json['parkName'] as String,
      json['longitude'] as String,
      json['latitude'] as String,
      json['supervisingPlan'] as String,
      json['parkRadius'] as int,
      json['parkRFID'] as String);
}

Map<String, dynamic> _$ParkInfoToJson(ParkInfo instance) => <String, dynamic>{
      'id': instance.id,
      'parkName': instance.parkName,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'supervisingPlan': instance.supervisingPlan,
      'parkRadius': instance.parkRadius,
      'parkRFID': instance.parkRFID
    };
