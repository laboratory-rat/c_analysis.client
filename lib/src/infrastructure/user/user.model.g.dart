// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..first_name = json['first_name'] as String
    ..last_name = json['last_name'] as String
    ..email = json['email'] as String
    ..avatar_url = json['avatar_url'] as String
    ..roles = (json['roles'] as List)?.map((e) => e as String)?.toList()
    ..token = json['token'] == null
        ? null
        : _userTokenFromJson(json['token'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'avatar_url': instance.avatar_url,
      'roles': instance.roles,
      'token':
          instance.token == null ? null : _userTokenModelToJson(instance.token)
    };

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) {
  return UserTokenModel()
    ..token = json['token'] as String
    ..expire =
        json['expire'] == null ? null : timeFromJson(json['expire'] as String);
}

Map<String, dynamic> _$UserTokenModelToJson(UserTokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expire': instance.expire == null ? null : timeToJson(instance.expire)
    };
