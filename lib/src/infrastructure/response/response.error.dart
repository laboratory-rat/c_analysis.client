import 'package:json_annotation/json_annotation.dart';

part 'response.error.g.dart';

@JsonSerializable()
class ResponseError {
  int code;
  String message;
  String user_message;
  dynamic data;

  ResponseError();

  factory ResponseError.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);
}
