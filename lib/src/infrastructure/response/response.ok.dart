import 'package:json_annotation/json_annotation.dart';

part 'response.ok.g.dart';

@JsonSerializable()
class ResponseOk{
  bool success;

  ResponseOk();

  factory ResponseOk.fromJson(Map<String, dynamic> json) =>
      _$ResponseOkFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseOkToJson(this);
}