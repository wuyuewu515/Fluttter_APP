// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultInfo _$ResultInfoFromJson(Map<String, dynamic> json) {
  return ResultInfo(
      json['state'] as int,
      json['code'] as String,
      json['msg'] as String,
      json['friendlyMsg'] as String,
      json['data'] as Object);
}

Map<String, dynamic> _$ResultInfoToJson(ResultInfo instance) =>
    <String, dynamic>{
      'state': instance.state,
      'code': instance.code,
      'msg': instance.msg,
      'friendlyMsg': instance.friendlyMsg,
      'data': instance.data
    };
