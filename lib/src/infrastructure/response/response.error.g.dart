// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseError _$ResponseErrorFromJson(Map<String, dynamic> json) {
  return ResponseError()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..user_message = json['user_message'] as String
    ..data = json['data'];
}

Map<String, dynamic> _$ResponseErrorToJson(ResponseError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'user_message': instance.user_message,
      'data': instance.data
    };
