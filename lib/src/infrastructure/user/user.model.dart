import 'package:json_annotation/json_annotation.dart';
import '../tools/datetime.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  String first_name;
  String last_name;
  String email;
  String avatar_url;

  List<String> roles;

  @JsonKey(fromJson: _userTokenFromJson, toJson: _userTokenModelToJson)
  UserTokenModel token;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserTokenModel {
  String token;

  @JsonKey(fromJson: timeFromJson, toJson: timeToJson)
  DateTime expire;

  UserTokenModel();

  factory UserTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UserTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenModelToJson(this);
}

UserTokenModel _userTokenFromJson(Map<String, dynamic> json) =>
    UserTokenModel.fromJson(json);
Map<String, dynamic> _userTokenModelToJson(UserTokenModel model) =>
    model.toJson();
